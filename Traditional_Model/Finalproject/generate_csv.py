import os
import json
import pandas as pd

IMG_DIR = "images"

# 1. load json files
poster_entries = []
for year in range(1980, 2016):
    json_file = os.path.join("groundtruth_cleaned", f"{year}_cleaned.json")
    if not os.path.exists(json_file):
        continue
    try:
        with open(json_file, "r", encoding="utf-8") as f:
            data_list = json.load(f)
    except Exception as e:
        print(f"{year}: Cannot decode file → {e}")
        continue

    for data in data_list:
        title = data.get("Title", "").strip()
        genre = data.get("Genre", "").strip()
        imdb_id = data.get("imdbID", "").strip()

        if title and genre and imdb_id:
            image_path = f"{IMG_DIR}/{year}/{imdb_id}.jpg"
            poster_entries.append({
                "Title": title,
                "Year": year,
                "Genre": genre,
                "imdbID": imdb_id,
                "Path": image_path
            })

# 2. create DataFrame and save
poster_df = pd.DataFrame(poster_entries)
poster_df = poster_df[poster_df["Path"] != ""]
poster_df[["Title", "Year", "Genre", "imdbID", "Path"]].to_csv("final_dataset.csv", index=False)
print("Saved as 'final_dataset.csv'")