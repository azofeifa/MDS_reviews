import pandas as pd, numpy as np
import os, sys

def run(root):
    DF         = None
    FHW        = open("/Users/azofeifa/subsampled_data/misc/all_mds_data.csv", "w")
    FHW.write("dataset,motif,mds,N,depth,window\n")
    for FILE in os.listdir(root):
        print FILE
        window = FILE.split("_")[1].split(".")[0]
        lines  = open(root+FILE, "r").readlines()[1:]
        for l in lines:
            lArray = l.strip("\n").split(",")
            lArray.append(lArray[0].split("_")[1] )
            lArray[0] = lArray[0].split("_")[0]
            lArray.append(window)
            FHW.write(",".join(lArray)+"\n")
def main():
    root = "/Users/azofeifa/subsampled_data/mds_score_files/"
    run(root)

main()

