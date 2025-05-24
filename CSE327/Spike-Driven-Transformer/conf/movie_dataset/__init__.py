from .dataset import SpikeDataset

def get_dataset(config):
    if config["dataset"] == "movie_dataset":
        return SpikeDataset(config["csv_path"])