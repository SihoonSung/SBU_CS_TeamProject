import os
import json
import pandas as pd
import requests
from tqdm import tqdm

IMG_DIR = "images"
os.makedirs(IMG_DIR, exist_ok=True)

# 1. Load movies_updated.csv
labels_df = pd.read_csv("movies_updated.csv")

# 2. 모든 txt 파일 처리
poster_entries = []
for year in range(1980, 2016):  # inclusive
    txt_file = f"{year}.txt"
    if not os.path.exists(txt_file):
        print(f"⚠️ {txt_file} not found, skipping.")
        continue

    with open(txt_file, "r", encoding="utf-8") as f:
        raw = f.read()
        raw = "[" + raw.replace("}\n{", "},\n{") + "]"
        try:
            data_list = json.loads(raw)
        except Exception as e:
            print(f"❌ Failed to parse {txt_file}: {e}")
            continue

        for data in data_list:
            poster_entries.append({
                "Title": data.get("Title", "").strip(),
                "Poster": data.get("Poster", "").strip(),
                "Genre": data.get("Genre", "").strip()
            })

poster_df = pd.DataFrame(poster_entries)

# 3. 병합
merged = pd.merge(labels_df, poster_df, on="Title", how="inner")

# 4. 이미지 다운로드
image_paths = []
for _, row in tqdm(merged.iterrows(), total=len(merged)):
    title = row["Title"].replace(" ", "_").replace("/", "_")
    url = row["Poster"]
    ext = ".jpg" if ".jpg" in url else ".png"
    filename = f"{title}{ext}"
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

# 5. 결과 저장
merged["image_path"] = image_paths
merged = merged[merged["image_path"] != ""]
merged[["image_path", "Genre"]].to_csv("final_dataset.csv", index=False)

print("✅ All done! Saved as 'final_dataset.csv'")