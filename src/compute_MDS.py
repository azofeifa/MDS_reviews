import numpy as np, os,sys

def load_data(FILE):
    FH = open(FILE, "r").readlines()[1:]
    motifs, X = list(),list()
    for line in FH:
        lineArray = line.strip("\n").split(",")
        motifs.append(lineArray[0])
        X.append(map(float, lineArray[1:]))
    return motifs, np.array(X)


def run(root, h):
    L      = list()
    FHW    = open("/Users/azofeifa/subsampled_data/mds_score_files/MDS_%d.csv"%h,"w")
    FHW.write("dataset,motif,mds,N\n")
    for j,f in enumerate(os.listdir(root)):
        motifs, X = load_data(root+f)
        c  = X.shape[1]/2
        a,b= c-h,c+h
        S  = np.sum(X,axis=1)
        S2 = np.sum(X[:,a:b],axis=1)
        for i,g in enumerate(motifs):
            FHW.write("%s,%s,%f,%d\n"%(f.split(".")[0], g, S2[i]/float(S[i]+1), S[i]+1))
    FHW.close()
def main():
    root = "/Users/azofeifa/subsampled_data/mds_files/"
    h    = int(sys.argv[1])
    run(root, h)
main()
