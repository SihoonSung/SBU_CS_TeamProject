from functools import partial
import torch
import torch.nn as nn
import torch.nn.functional as F
from timm.models.layers import trunc_normal_
from timm.models.registry import register_model
from timm.models.vision_transformer import _cfg
from spikingjelly.clock_driven.neuron import (
    MultiStepLIFNode,
    MultiStepParametricLIFNode,
)
from module import *

class PatchEmbed(nn.Module):
    def forward(self, x, hook=None):
        if x.dim() == 3:  # [B, T, C]
            x = x.permute(1, 0, 2).unsqueeze(-1).unsqueeze(-1)  # → [T, B, C, 1, 1]
        elif x.dim() == 5:
            if x.shape[0] == self.T:  # [T, B, C, 1, 1]
                pass
            elif x.shape[1] == self.T:  # [B, T, C, 1, 1]
                x = x.permute(1, 0, 2, 3, 4)  # → [T, B, C, 1, 1]
            else:
                raise ValueError(f"Unrecognized 5D input shape {x.shape}")
        else:
            raise ValueError(f"Unsupported input shape {x.shape}")

        x, hook = self.forward_features(x, hook=hook)  # x: [T, B, C]
        x = self.head_lif(x)  # apply spiking activation: [T, B, C]
        if hook is not None:
            hook["head_lif"] = x.detach()

        x = self.head(x)  # Linear layer: [T, B, num_classes]
        if not self.TET:
            x = x.mean(0)  # → [B, num_classes]

        return x, hook

class SpikeDrivenTransformer(nn.Module):
    def __init__(
        self,
        img_size_h=128,
        img_size_w=128,
        patch_size=16,
        in_channels=2,
        num_classes=11,
        embed_dims=512,
        num_heads=8,
        mlp_ratios=4,
        qkv_bias=False,
        qk_scale=None,
        drop_rate=0.0,
        attn_drop_rate=0.0,
        drop_path_rate=0.0,
        norm_layer=nn.LayerNorm,
        depths=[6, 8, 6],
        sr_ratios=[8, 4, 2],
        T=4,
        pooling_stat="1111",
        attn_mode="direct_xor",
        spike_mode="lif",
        get_embed=False,
        dvs_mode=False,
        TET=False,
        cml=False,
        pretrained=False,
        pretrained_cfg=None,
        **kwargs,
    ):
        super().__init__()
        self.num_classes = num_classes
        self.depths = depths

        self.T = T
        self.TET = TET
        self.dvs = dvs_mode

        dpr = [
            x.item() for x in torch.linspace(0, drop_path_rate, depths)
        ]  # stochastic depth decay rule

        self.patch_embed = PatchEmbed()

        blocks = nn.ModuleList(
            [
                MS_Block_Conv(
                    dim=embed_dims,
                    num_heads=num_heads,
                    mlp_ratio=mlp_ratios,
                    qkv_bias=qkv_bias,
                    qk_scale=qk_scale,
                    drop=drop_rate,
                    attn_drop=attn_drop_rate,
                    drop_path=dpr[j],
                    norm_layer=norm_layer,
                    sr_ratio=sr_ratios,
                    attn_mode=attn_mode,
                    spike_mode=spike_mode,
                    dvs=dvs_mode,
                    layer=j,
                )
                for j in range(depths)
            ]
        )

        setattr(self, f"block", blocks)

        # classification head
        if spike_mode in ["lif", "alif", "blif"]:
            self.head_lif = MultiStepLIFNode(tau=2.0, detach_reset=True, backend="torch")
        elif spike_mode == "plif":
            self.head_lif = MultiStepParametricLIFNode(
                init_tau=2.0, detach_reset=True, backend="torch"
            )
        self.head = (
            nn.Linear(embed_dims, num_classes) if num_classes > 0 else nn.Identity()
        )
        self.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Conv2d):
            trunc_normal_(m.weight, std=0.02)
            if m.bias is not None:
                nn.init.constant_(m.bias, 0)
        elif isinstance(m, nn.BatchNorm2d):
            nn.init.constant_(m.bias, 0)
            nn.init.constant_(m.weight, 1.0)

    def forward_features(self, x, hook=None):
        block = self.block
        for blk in block:
            x, _, hook = blk(x, hook=hook)
        x = x.flatten(3).mean(3)  
        return x, hook

    def forward(self, x, hook=None):
        if x.dim() == 3:  # [B, T, C]
            x = x.permute(1, 0, 2).unsqueeze(-1).unsqueeze(-1)
        elif x.dim() == 5:  # already in [T, B, C, 1, 1]
            x = x.permute(1, 0, 2, 3, 4)
        elif x.dim() != 5 or x.shape[0] != self.T:
            raise ValueError(f"Unsupported input shape {x.shape}")

        x, hook = self.forward_features(x, hook=hook)
        x = self.head_lif(x)
        if hook is not None:
            hook["head_lif"] = x.detach()

        x = self.head(x)
        if not self.TET:
            x = x.mean(0)
        return x, hook


@register_model
def sdt(**kwargs):
    model = SpikeDrivenTransformer(
        **kwargs,
    )
    model.default_cfg = _cfg()
    return model
