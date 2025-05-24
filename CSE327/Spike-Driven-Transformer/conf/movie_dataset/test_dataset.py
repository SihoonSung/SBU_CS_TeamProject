import torch
from torch.utils.data import DataLoader
from dataset import SpikeDataset

csv_path = "./conf/movie_dataset/spike_encoded_dataset.csv"

dataset = SpikeDataset(csv_path)

dataloader = DataLoader(dataset, batch_size=4, shuffle=True)

for x, y in dataloader:
    print("Input shape:", x.shape) 
    print("Label shape:", y.shape)
    print("First input sample:", x[0])
    print("First label:", y[0])
    break