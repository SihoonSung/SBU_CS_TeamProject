import pandas as pd
import matplotlib.pyplot as plt

resnet_path = './results/resnet18/ResNet18_results.csv'
vit_path = './results/vit/ViT_results.csv'
sdt_path = '/Users/minguhwang/Documents/GitHub/SBU_CS_TeamProject/CSE327/Spike-Driven-Transformer/output/train/20250525-125455-sdt-data-movie-t-10-spike-lif/summary.csv'

resnet_df = pd.read_csv(resnet_path)
vit_df = pd.read_csv(vit_path)
sdt_df = pd.read_csv(sdt_path)

plt.figure(figsize=(12, 6))
plt.plot(resnet_df['epoch'], resnet_df['val_top1'], label='ResNet18')
plt.plot(vit_df['epoch'], vit_df['val_top1'], label='ViT')
plt.plot(sdt_df['epoch'], sdt_df['eval_top1'], label='Spike-Driven Transformer')  # acc1 = Top-1

plt.title("Top-1 Accuracy Comparison")
plt.xlabel("Epoch")
plt.ylabel("Top-1 Accuracy (%)")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig('./results/comparison_plot.png')
plt.show()