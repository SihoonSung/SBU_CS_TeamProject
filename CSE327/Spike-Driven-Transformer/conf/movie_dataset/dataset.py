import pandas as pd
import torch
from torch.utils.data import Dataset
import numpy as np

class SpikeDataset(Dataset):
    def __init__(self, csv_path, time_steps=10):
        df = pd.read_csv(csv_path)
        data = df.drop(columns=["label"]).values.astype('float32')
        data = data / data.max()  # normalize to [0, 1]

        self.X = data.reshape(-1, time_steps, data.shape[1] // time_steps)  # shape: [N, T, C]
        self.y = df["label"].values.astype('int64')
        self.T = time_steps

    def __len__(self):
        return len(self.y)

    def __getitem__(self, idx):
        x = torch.tensor(self.X[idx], dtype=torch.float32)  # shape: [T, C]
        y = torch.tensor(self.y[idx], dtype=torch.long)     # scalar label
        return x, y