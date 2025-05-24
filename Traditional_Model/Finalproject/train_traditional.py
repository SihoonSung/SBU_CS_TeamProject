import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader
import pandas as pd
from tqdm import tqdm

# MPS 지원 여부 출력
if torch.backends.mps.is_available():
    print("MPS is available ✅")
else:
    print("MPS not available ❌")

# 데이터셋 클래스
class SpikeDataset(Dataset):
    def __init__(self, csv_path):
        df = pd.read_csv(csv_path)
        self.X = df.drop(columns=["label"]).values.astype('float32')
        self.y = df["label"].values.astype('int64')

    def __len__(self):
        return len(self.y)

    def __getitem__(self, idx):
        return torch.tensor(self.X[idx]), torch.tensor(self.y[idx])

# MLP 모델 정의
class MLPClassifier(nn.Module):
    def __init__(self, input_dim=1280, hidden_dim=512, output_dim=25):
        super(MLPClassifier, self).__init__()
        self.net = nn.Sequential(
            nn.Linear(input_dim, hidden_dim),
            nn.ReLU(),
            nn.Linear(hidden_dim, hidden_dim // 2),
            nn.ReLU(),
            nn.Linear(hidden_dim // 2, output_dim)
        )

    def forward(self, x):
        return self.net(x)

# 학습 함수 (tqdm 적용)
def train(model, loader, optimizer, criterion, device):
    model.train()
    loop = tqdm(loader, desc="Training", leave=False)
    for X, y in loop:
        X, y = X.to(device), y.to(device)
        optimizer.zero_grad()
        out = model(X)
        loss = criterion(out, y)
        loss.backward()
        optimizer.step()
        loop.set_postfix(loss=loss.item())

# 평가 함수 (tqdm 적용)
def evaluate(model, loader, device):
    model.eval()
    correct = total = 0
    loop = tqdm(loader, desc="Evaluating", leave=False)
    with torch.no_grad():
        for X, y in loop:
            X, y = X.to(device), y.to(device)
            pred = model(X).argmax(dim=1)
            correct += (pred == y).sum().item()
            total += y.size(0)
    return correct / total

# 실행 코드
csv_path = "spike_encoded_dataset.csv"  # 파일 경로 확인 필요
device = torch.device("mps" if torch.backends.mps.is_available() else "cpu")

dataset = SpikeDataset(csv_path)
loader = DataLoader(dataset, batch_size=32, shuffle=True)

model = MLPClassifier().to(device)
optimizer = optim.Adam(model.parameters(), lr=1e-3)
criterion = nn.CrossEntropyLoss()

for epoch in range(10):
    print(f"Epoch {epoch+1}")
    train(model, loader, optimizer, criterion, device)
    acc = evaluate(model, loader, device)
    print(f"Accuracy: {acc:.4f}")