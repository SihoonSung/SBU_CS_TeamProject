import os
import cv2
import pandas as pd
import numpy as np
from tqdm import tqdm
from sklearn.preprocessing import LabelEncoder

IMG_ROOT = "images"
CSV_PATH = "final_dataset.csv"
OUTPUT_CSV = "spike_encoded_dataset.csv"
LABEL_CLASS_PATH = "classes.npy"

RESIZE_SHAPE = (16, 8)
TIME_STEPS = 10

allowed_genres = [
    "action", "adventure", "animation", "biography", "comedy", "crime", "documentary", "drama",
    "family", "fantasy", "film-noir", "history", "horror", "music", "musical", "mystery",
    "news", "romance", "sci-fi", "short", "sport", "superhero", "thriller", "war", "western",
    "reality-tv", "game-show", "talk-show"
]

def clean_genre(g):
    if pd.isna(g): return None
    first = g.split("|")[0].strip().lower()
    return first if first in allowed_genres else None

def poisson_encode(img, time_steps=TIME_STEPS):
    img = img.astype(np.float32) / 255.0
    spikes = np.random.rand(time_steps, *img.shape) < img
    return spikes.astype(np.uint8)

# CSV load + genre clean
df = pd.read_csv(CSV_PATH)
df["MainGenre"] = df["Genre"].apply(clean_genre)
df = df.dropna(subset=["MainGenre"])

le = LabelEncoder()
df["label"] = le.fit_transform(df["MainGenre"])
np.save(LABEL_CLASS_PATH, le.classes_)

# spike encoding
spike_data = []
for row in tqdm(df.itertuples(), total=len(df)):
    imdb_id = row.imdbID
    year = str(row.Year)
    label = row.label

    img_path = os.path.join(IMG_ROOT, year, f"{imdb_id}.jpg")
    if not os.path.exists(img_path):
        continue

    img = cv2.imread(img_path, cv2.IMREAD_GRAYSCALE)
    if img is None:
        continue

    img = cv2.resize(img, RESIZE_SHAPE)
    spikes = poisson_encode(img)
    spikes_flat = spikes.flatten()

    spike_row = {
        "label": label,
        **{f"t{t}": val for t, val in enumerate(spikes_flat)}
    }
    spike_data.append(spike_row)

# save
spike_df = pd.DataFrame(spike_data)
spike_df.to_csv(OUTPUT_CSV, index=False)
print(f"Spike-encoded CSV saved to {OUTPUT_CSV}")
print(f"Label classes saved to {LABEL_CLASS_PATH}")
print(f"Total unique labels: {len(le.classes_)}")