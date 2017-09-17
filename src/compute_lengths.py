import pandas as pd
import numpy as np,os


def iterate(root):
    meta = pd.read_csv(root+"metadata.tsv",sep="\t",index_col=[0])
    FHW  = open("../files/average_chromatin_mark_lengths.csv", "w")
    FHW.write("antibody,length,ENC\n")
    for f in os.listdir(root):
        if ".bed" == f[-4:]:
            if f[:-4] in meta.index:
                m  = meta.loc[f[:-4]]["Experiment target"]
                
                df = pd.read_csv(root+f,sep="\t",header=None)
                avg = np.average(df[2]-df[1])
                FHW.write(m+","+str(avg) + "," + f[:-4]+"\n")
                FHW.flush()

def main():
    root="../chromatin_marks/"
    iterate(root)

main()
