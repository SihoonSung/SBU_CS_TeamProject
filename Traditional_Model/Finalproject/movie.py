import os
import pandas as pd
import numpy as np
import tqdm
import argparse

def load_csv(csv_path):
    df = pd.read_csv(csv_path)
    return df[['image_path', 'label']].values  # adjust if your CSV column names differ

def preprocess_image(image_path, size=(64, 64)):
    # Load and preprocess the image: grayscale + resize + normalize
    img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
    if img is None:
        raise FileNotFoundError(f"Image not found: {image_path}")
    img = cv2.resize(img, size)
    img = img.astype(np.float32) / 255.0  # normalize to [0, 1]
    return img

def encode_to_spikes(image, threshold=0.2):
    # Simple threshold-based spike encoding:
    # pixels with intensity > threshold emit a spike (1), else no spike (0)
    spikes = (image > threshold).astype(np.uint8)
    return spikes

def save_event_dataset(spike_images, labels, save_path="snn_dataset.npz"):
    np.savez_compressed(save_path, data=spike_images, labels=labels)
    print(f"Saved dataset to {save_path}")

def main(csv_path, output_path="snn_dataset.npz", image_size=(64, 64), threshold=0.2):
    print("Loading CSV...")
    entries = load_csv(csv_path)

    spike_images = []
    labels = []

    print("Processing images...")
    for img_path, label in tqdm.tqdm(entries):
        try:
            img = preprocess_image(img_path, size=image_size)
            spikes = encode_to_spikes(img, threshold)
            spike_images.append(spikes)
            labels.append(label)
        except Exception as e:
            print(f"Error processing {img_path}: {e}")

    spike_images = np.stack(spike_images)
    labels = np.array(labels)

    save_event_dataset(spike_images, labels, save_path=output_path)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--csv_path", type=str, required=True, help="Path to movies_updated.csv")
    parser.add_argument("--output_path", type=str, default="snn_dataset.npz", help="Path to save encoded dataset")
    parser.add_argument("--size", type=int, nargs=2, default=[64, 64], help="Resize images to (H, W)")
    parser.add_argument("--threshold", type=float, default=0.2, help="Spike threshold (0~1)")
    args = parser.parse_args()

    main(csv_path=args.csv_path, output_path=args.output_path, image_size=tuple(args.size), threshold=args.threshold)