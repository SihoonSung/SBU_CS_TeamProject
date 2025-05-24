import torch
from torch.utils.data import Dataset
import pandas as pd

class SpikeCSVData(Dataset):
    def __init__(self, csv_path):
        df = pd.read_csv(csv_path)
        self.labels = df['label'].values
        self.spikes = df.drop(columns=['label']).values.reshape(-1, TIME_STEPS, FEATURES)

    def __len__(self):
        return len(self.labels)

    def __getitem__(self, idx):
        x = torch.tensor(self.spikes[idx], dtype=torch.float32)
        y = torch.tensor(self.labels[idx], dtype=torch.long)
        return x, y