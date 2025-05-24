import os
import json

# 폴더 경로 설정 (필요 시 수정)
data_folder = './groundtruth_cleaned/'
genre_set = set()

# 1980~2015
for year in range(1980, 2016):
    file_path = os.path.join(data_folder, f"{year}_cleaned.json")
    if not os.path.exists(file_path):
        print(f"No file: {file_path}")
        continue

    with open(file_path, 'r') as f:
        try:
            movies = json.load(f)
        except Exception as e:
            print(f"JSON error ({year}):", e)
            continue

        for movie in movies:
            if 'Genre' in movie and movie['Genre']:
                genres = [g.strip() for g in movie['Genre'].split(',')]
                genre_set.update(genres)

print(f"Number of Genres: {len(genre_set)}")
print("List of Genres:", sorted(genre_set))