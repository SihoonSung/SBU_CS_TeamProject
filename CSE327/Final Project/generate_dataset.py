import os
import json
import pandas as pd
import requests
from tqdm import tqdm
import re
import ast

IMG_DIR = "images"
os.makedirs(IMG_DIR, exist_ok=True)

# 1. Load movies_updated.csv
labels_df = pd.read_csv("movies_updated.csv")

# 2. txt file processing
poster_entries = []
for year in range(1980, 2016):
    txt_file = os.path.join("groundtruth", f"{year}.txt")
    if not os.path.exists(txt_file):
        continue
    try:
        with open(txt_file, "r", encoding="utf-8") as f:
            raw = f.read()
    except UnicodeDecodeError:
        try:
            with open(txt_file, "r", encoding="latin1") as f:
                raw = f.read()
        except Exception as e:
            print(f"{year}: Cannot decode file → {e}")
            continue

    raw = raw.replace('\x00', '')

    lines = raw.split("}\n{")
    lines = [line if line.startswith("{") else "{" + line for line in lines]
    lines = [line if line.endswith("}") else line + "}" for line in lines]

    data_list = []
    for i, line in enumerate(lines):
        line = line.strip()
        if not line:
            continue
        try:
            line = re.sub(r'"_id"\s*:\s*ObjectId\(".*?"\)', '"_id": "ObjectId"', line)
            line = re.sub(r'([{\s,])([A-Za-z_][A-Za-z0-9_]*)(\s*):', r'\1"\2"\3:', line)
            data = json.loads(line)
            data_list.append(data)
        except Exception as e:
            print(f"{year}: Failed to parse entry #{i} → {e}")
            continue

    for data in data_list:
        poster_entries.append({
            "Title": data.get("Title", "").strip(),
            "Poster": data.get("Poster", "").strip(),
            "Genre": data.get("Genre", "").strip(),
            "Year": year
        })

poster_df = pd.DataFrame(poster_entries)
if poster_df.empty or "Title" not in poster_df.columns:
    print("poster_df is empty or missing 'Title' column. Check parsing step.")
    print(f"poster_entries length: {len(poster_entries)}")
    exit()

# 3. merge
merged = pd.merge(labels_df, poster_df, on="Title", how="inner")

# 4. Image download
image_paths = []
for _, row in tqdm(merged.iterrows(), total=len(merged)):
    title = row["Title"].replace(" ", "_").replace("/", "_")
    year = row["Year"]
    url = row["Poster"]
    ext = os.path.splitext(url)[-1]
    if ext.lower() not in [".jpg", ".jpeg", ".png"]:
        ext = ".jpg"
    filename = f"{title}_{year}{ext}"
    local_path = os.path.join(IMG_DIR, filename)

    try:
        if not os.path.exists(local_path):
            r = requests.get(url, timeout=5)
            if r.status_code == 200:
                with open(local_path, "wb") as f:
                    f.write(r.content)
        image_paths.append(local_path)
    except Exception as e:
        print(f"Download failed for {url}: {e}")
        image_paths.append("")

# 5. Save the result
merged["image_path"] = image_paths
merged = merged[merged["image_path"] != ""]
merged[["image_path", "Genre"]].to_csv("final_dataset.csv", index=False)
print("Saved as 'final_dataset.csv'")