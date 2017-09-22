import pandas as pd, numpy as np
import os, sys

def run(root):
    DF         = None
    for FILE in os.listdir(root):
        print FILE
        window = FILE.split("_")[1].split(".")[0]
        df     = pd.read_csv(root+FILE)
        df["depth"] = [y.split("_")[1] for y in df.dataset ]
        df["dataset"] = [y.split("_")[0] for y in df.dataset ]
        df["window"]  = window
        if DF is None:
            DF = df
        else:
            DF = pd.concat([DF, df])
    DF.to_csv("../files/all_mds_data.csv",index=None)
def main():
    root = "/Users/azofeifa/subsampled_data/mds_score_files/"
    run(root)

main()

