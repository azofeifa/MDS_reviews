import pandas as pd,numpy as np, os,sys


def run(root, h):
    L      = list()
    for j,f in enumerate(os.listdir(root)):
        df = pd.read_csv(root+f).as_matrix()
        X  = df[:,1:]
        c  = X.shape[1]/2
        a,b= c-h,c+h
        S  = np.sum(X,axis=1)
        S2 = np.sum(X[:,a:b],axis=1)
        for i,g in enumerate(df[:,0]):
            L.append((f.split(".")[0], g, S2[i]/float(S[i]+1), S[i]+1 ))
    df = pd.DataFrame(data=L, columns=("dataset","motif", "mds", "N"))
    df.to_csv("/Users/azofeifa/subsampled_data/mds_score_files/MDS_%d.csv"%h,index=False)
def main():
    root = "/Users/azofeifa/subsampled_data/mds_files/"
    h    = int(sys.argv[1])
    run(root, h)
main()
