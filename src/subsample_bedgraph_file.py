import sys,numpy as np


def subsample(FILE, percent, out):
    FHW = open(out, "w")
    with open(FILE) as FH:
        for line in FH:
            chrom,start,stop,cov = line.strip("\n").split("\t")
            cov   = int(cov)
            minus = cov < 0
            cov   = int(sum(np.random.uniform(0,100,abs(cov)) > percent))
            if cov > 0:
                cov = str(cov)
                if minus:
                    cov = "-"+cov
                FHW.write("\t".join([chrom,start,stop,cov])+"\n" )
    FHW.close()


def main():
    FILE = sys.argv[1]
    PER  = float(sys.argv[2])
    OUT  = sys.argv[3]
    subsample(FILE, PER,OUT)

main()
