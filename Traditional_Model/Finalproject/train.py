import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader
from tqdm import tqdm
from model import SpikeDrivenTransformer
from dataset import SpikeDataset
from spikingjelly.clock_driven import functional

# MPS 지원 여부 확인
device = torch.device("mps" if torch.backends.mps.is_available() else "cpu")
print(f"Using device: {device}")

# 하이퍼파라미터
csv_path = "spike_encoded_dataset.csv"
batch_size = 32
epochs = 10
learning_rate = 1e-3

# 데이터 로딩
dataset = SpikeDataset(csv_path)
loader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

# 모델, 손실 함수, 옵티마이저 정의
model = SpikeDrivenTransformer()
model.to(device)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=learning_rate)

# 학습 함수
def train(model, loader, optimizer, criterion, device):
    model.train()
    loop = tqdm(loader, desc="Training", leave=False)
    for X, y in loop:
        X, y = X.to(device), y.to(device)
        optimizer.zero_grad()
        outputs = model(X)
        loss = criterion(outputs, y)
        loss.backward()
        optimizer.step()
        functional.reset_net(model)
        loop.set_postfix(loss=loss.item())

# 평가 함수
def evaluate(model, loader, device):
    model.eval()
    correct = total = 0
    loop = tqdm(loader, desc="Evaluating", leave=False)
    with torch.no_grad():
        for X, y in loop:
            X, y = X.to(device), y.to(device)
            outputs = model(X)
            _, predicted = torch.max(outputs.data, 1)
            total += y.size(0)
            correct += (predicted == y).sum().item()
    return correct / total

# 학습 루프
for epoch in range(epochs):
    print(f"Epoch {epoch+1}/{epochs}")
    train(model, loader, optimizer, criterion, device)
    accuracy = evaluate(model, loader, device)
    print(f"Accuracy: {accuracy:.4f}")