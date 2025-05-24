import torch
from torch.utils.data import Dataset
import pandas as pd

class SpikeDataset(Dataset):
    def __init__(self, csv_path):
        df = pd.read_csv(csv_path)
        self.X = df.drop(columns=["label"]).values.astype('float32')
        self.y = df["label"].values.astype('int64')

    def __len__(self):
        return len(self.y)

    def __getitem__(self, idx):
        return torch.tensor(self.X[idx]), torch.tensor(self.y[idx])