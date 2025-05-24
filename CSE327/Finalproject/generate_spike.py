import os
import cv2
import pandas as pd
import numpy as np
from tqdm import tqdm

# set routes
IMG_ROOT = "images"
CSV_PATH = "final_dataset.csv"
OUTPUT_CSV = "spike_encoded_dataset.csv"

# Spike encoding parameter
RESIZE_SHAPE = (32, 32)
TIME_STEPS = 20  # spike train length

def poisson_encode(img, time_steps=TIME_STEPS):
    # Normalize grayscale images from 0 to 1 and convert them into Poisson spike sequences
    img = img / 255.0  # normalize
    spikes = np.random.rand(time_steps, *img.shape) < img  # True/False spike
    return spikes.astype(np.uint8)

# load data
df = pd.read_csv(CSV_PATH)

# imdbID based path
spike_data = []
for _, row in tqdm(df.iterrows(), total=len(df)):
    imdb_id = row["imdbID"]
    year = str(row["Year"])
    genre = row["Genre"]

    img_path = os.path.join(IMG_ROOT, year, f"{imdb_id}.jpg")
    if not os.path.exists(img_path):
        continue

    img = cv2.imread(img_path, cv2.IMREAD_GRAYSCALE)
    if img is None:
        continue

    img = cv2.resize(img, RESIZE_SHAPE)
    spikes = poisson_encode(img)  # shape: (T, H, W)

    spikes_flat = spikes.flatten()
    spike_row = {
        "imdbID": imdb_id,
        "Genre": genre,
        **{f"t{t}": val for t, val in enumerate(spikes_flat)}
    }
    spike_data.append(spike_row)

# save
spike_df = pd.DataFrame(spike_data)
spike_df.to_csv(OUTPUT_CSV, index=False)
print(f"Spike-encoded CSV saved to {OUTPUT_CSV}")