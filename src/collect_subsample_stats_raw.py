import numpy as np,pandas as pd
import os
def run(DIR):
    D    = list()
    for f in os.listdir(DIR):
        if "bidir_pred" in f:
            N = len(open(DIR+f).readlines())
            f = f.split("-")[0]
            SRR,depth,rep = f.split("_")
            D.append((SRR, depth, N))
    df   = pd.DataFrame(data=D,columns=("SRR", "depth", "bidirectionals" ))
    df.to_csv("../files/bidirectionals_vs_subsampling.csv",index=None)
def main():
    DIR="/Users/azofeifa/subsampled_data/tfit_files/"
    run(DIR)

main()

