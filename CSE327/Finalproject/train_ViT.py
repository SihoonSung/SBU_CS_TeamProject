import os
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader
from torchvision import models, transforms
from PIL import Image
from tqdm import tqdm
import matplotlib.pyplot as plt
import timm
import pandas as pd
import csv

# config
df = pd.read_csv('final_dataset.csv')
df = df.dropna(subset=['Genre'])
primary_genres = df['Genre'].apply(lambda x: x.split(',')[0].strip())
print("Genre Distribution:")
print(primary_genres.value_counts())
csv_path = './final_dataset.csv'
img_root = './'
num_classes = 25
epochs = 100
batch_size = 32
learning_rate = 1e-4

if torch.backends.mps.is_available() and torch.backends.mps.is_built():
    device = torch.device('mps')
    print("Mac GPU")
elif torch.cuda.is_available():
    device = torch.device('cuda')
    print("NVIDIA")
else:
    device = torch.device('cpu')
    print("CPU")
    
# transform
transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize([0.5]*3, [0.5]*3),
])

# dataset
class PosterDataset(Dataset):
    def __init__(self, csv_file, root_dir, transform=None):
        self.data = pd.read_csv(csv_file)
        self.data = self.data.dropna(subset=['Genre', 'Path'])
        self.root_dir = root_dir
        self.transform = transform
        self.data['primary_genre'] = self.data['Genre'].apply(lambda x: x.split(',')[0].strip())
        self.data = self.data[self.data['Path'].apply(lambda p: os.path.exists(os.path.join(root_dir, p)))]
        self.classes = sorted(self.data['primary_genre'].unique())
        self.class_to_idx = {label: idx for idx, label in enumerate(self.classes)}

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        img_path = os.path.join(self.root_dir, self.data.iloc[idx]['Path'])
        image = Image.open(img_path).convert('RGB')
        label_str = self.data.iloc[idx]['primary_genre']
        label = self.class_to_idx[label_str]
        if self.transform:
            image = self.transform(image)
        return image, label
    
# split csv into train/val
df = pd.read_csv(csv_path)
train_df = df.sample(frac=0.8, random_state=42)
val_df = df.drop(train_df.index)
train_df.to_csv('train_split.csv', index=False)
val_df.to_csv('val_split.csv', index=False)

train_dataset = PosterDataset('train_split.csv', img_root, transform)
val_dataset = PosterDataset('val_split.csv', img_root, transform)
train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=batch_size, shuffle=False)

# model
model = timm.create_model('vit_base_patch16_224', pretrained=True, num_classes=num_classes)
model = model.to(device)

# loss & optimize
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=learning_rate)

# accuracy
def accuracy(output, target, topk=(1,5)):
    with torch.no_grad():
        maxk = max(topk)
        batch_size = target.size(0)
        _, pred = output.topk(maxk, 1, True, True)
        pred = pred.t()
        correct = pred.eq(target.view(1, -1).expand_as(pred))

        res = []
        for k in topk:
            correct_k = correct[:k].reshape(-1).float().sum(0)
            res.append(100.0 * correct_k / batch_size)
        return res
    

results_dir = './results/vit'
os.makedirs(results_dir, exist_ok=True)

output_csv = os.path.join(results_dir, 'ViT_results.csv')
plot_path = os.path.join(results_dir, 'accuracy_plot.png')
model_path = os.path.join(results_dir, 'model_final.pth')

# train
with open(output_csv, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['epoch', 'train_loss', 'val_loss', 'val_top1', 'val_top5'])

    for epoch in range(epochs):
        model.train()
        running_loss = 0.0

        for images, labels in tqdm(train_loader, desc=f"Epoch {epoch+1} [Train]"):
            images, labels = images.to(device), labels.to(device)
            optimizer.zero_grad()
            outputs = model(images)
            loss = criterion(outputs, labels)
            loss.backward()
            optimizer.step()
            running_loss += loss.item()
        train_loss = running_loss / len(train_loader)

        # validation
        model.eval()
        val_loss = 0.0
        top1_total = 0.0
        top5_total = 0.0

        with torch.no_grad():
            for images, labels in tqdm(val_loader, desc=f"Epoch {epoch+1} [Val]"):
                images, labels = images.to(device), labels.to(device)
                outputs = model(images)
                loss = criterion(outputs, labels)
                val_loss += loss.item()
                top1, top5 = accuracy(outputs, labels)
                top1_total += top1
                top5_total += top5

        val_loss /= len(val_loader)
        val_top1 = top1_total / len(val_loader)
        val_top5 = top5_total / len(val_loader)

        print(f"Epoch {epoch+1}/{epochs} - Train Loss: {train_loss:.4f} | Val Loss: {val_loss:.4f} | Top-1: {val_top1:.2f}% | Top-5: {val_top5:.2f}%")
        writer.writerow([epoch, train_loss, val_loss, val_top1.item(), val_top5.item()])

torch.save(model.state_dict(), model_path)
df = pd.read_csv(output_csv)
plt.figure(figsize=(10, 6))
plt.plot(df['epoch'], df['val_top1'], marker='o', label='Top-1 Accuracy')

for x, y in zip(df['epoch'], df['val_top1']):
    if x % 5 == 0:
        plt.text(x, y+0.5, f"{y:.2f}%", fontsize=8, color='blue')

plt.title("Validation Top-1 Accuracy per Epoch")
plt.xlabel("Epoch")
plt.ylabel("Top-1 Accuracy (%)")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(plot_path)
plt.show()