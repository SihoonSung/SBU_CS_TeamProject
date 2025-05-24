import torch
import torch.nn as nn
from spikingjelly.clock_driven import neuron, functional, surrogate, layer
from torch.nn import MultiheadAttention

# 스파이크 Attention Block
class SpikeTransformerBlock(nn.Module):
    def __init__(self, embed_dim, num_heads, mlp_dim):
        super().__init__()
        self.attn = MultiheadAttention(embed_dim, num_heads, batch_first=True)
        self.lif1 = neuron.MultiStepLIFNode(surrogate_function=surrogate.Sigmoid(), detach_reset=True)
        self.fc1 = nn.Linear(embed_dim, mlp_dim)
        self.fc2 = nn.Linear(mlp_dim, embed_dim)
        self.lif2 = neuron.MultiStepLIFNode(surrogate_function=surrogate.Sigmoid(), detach_reset=True)
        self.norm1 = nn.LayerNorm(embed_dim)
        self.norm2 = nn.LayerNorm(embed_dim)

    def forward(self, x):  # x: [B, T, C]
        # Attention
        res = x
        x_norm = self.norm1(x)
        attn_out, _ = self.attn(x_norm, x_norm, x_norm)  # [B, T, C]
        x = self.lif1(attn_out + res)

        # Feedforward
        res = x
        x_norm = self.norm2(x)
        x = self.fc2(torch.relu(self.fc1(x_norm)))
        x = self.lif2(x + res)
        return x

# 전체 모델
class SpikeDrivenTransformer(nn.Module):
    def __init__(self, input_dim=1280, embed_dim=256, num_heads=4, mlp_dim=512, num_classes=25, time_steps=4, num_layers=2):
        super().__init__()
        self.time_steps = time_steps
        self.input_proj = nn.Linear(input_dim, embed_dim)
        self.blocks = nn.ModuleList([
            SpikeTransformerBlock(embed_dim, num_heads, mlp_dim)
            for _ in range(num_layers)
        ])
        self.classifier = nn.Linear(embed_dim, num_classes)

    def forward(self, x):  # x: [B, input_dim]
        B = x.size(0)
        x = self.input_proj(x)                     # [B, embed_dim]
        x = x.unsqueeze(1).repeat(1, self.time_steps, 1)  # [B, T, embed_dim]

        for block in self.blocks:
            x = block(x)  # spike-based attention + MLP

        out = x.mean(dim=1)  # time 평균
        return self.classifier(out)