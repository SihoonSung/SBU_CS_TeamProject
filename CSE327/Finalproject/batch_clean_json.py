import json
import re
import os

def clean_entry(block):
    block = re.sub(r'"_id"\s*:\s*ObjectId\(".*?"\)\s*,?', '', block)
    block = re.sub(r',\s*([}\]])', r'\1', block)
    return block.strip()

def detect_encoding(file_path):
    with open(file_path, 'rb') as f:
        raw = f.read(4)
    if raw.startswith(b'\xff\xfe'):
        return 'utf-16'
    elif raw.startswith(b'\xef\xbb\xbf'):
        return 'utf-8-sig'
    else:
        return 'utf-8'

def clean_file(year):
    input_filename = f"groundtruth/{year}.txt"
    output_dir = "groundtruth_cleaned"
    output_filename = f"{output_dir}/{year}_cleaned.json"

    if not os.path.exists(input_filename):
        print(f"[SKIP] File not found: {input_filename}")
        return

    os.makedirs(output_dir, exist_ok=True)
    encoding = detect_encoding(input_filename)

    with open(input_filename, 'r', encoding=encoding) as f:
        content = f.read()

    # Extract JSON-like blocks
    raw_blocks = re.findall(r'{[^{}]*}', content, re.DOTALL)
    parsed_entries = []

    for i, block in enumerate(raw_blocks):
        try:
            cleaned = clean_entry(block)
            parsed = json.loads(cleaned)
            parsed_entries.append(parsed)
        except json.JSONDecodeError as e:
            print(f"[ERROR] {year}: Entry #{i} failed to parse: {e}")

    with open(output_filename, 'w', encoding='utf-8') as f:
        json.dump(parsed_entries, f, indent=2, ensure_ascii=False)

    print(f"[DONE] {year}: Parsed {len(parsed_entries)} entries → {output_filename}")

def main():
    for year in range(1980, 2016):
        clean_file(year)

if __name__ == "__main__":
    main()