#!/bin/bash
echo $1
echo $2
echo $3

kmer1=25
kmer2=32
name1=run.k${kmer1}
name2=run.k${kmer2}
reads1=$1
reads2=$2
outdir=$3
assemblydir1=$outdir/${name1}
assemblydir2=$outdir/${name2}
finalassembly1=${assemblydir1}/${name1}-final.fa
finalassembly2=${assemblydir2}/${name2}-final.fa
mergedassembly=$outdir/merged.fa
TRANSABYSS_PATH=$(readlink -f transabyss)

transabyss -k ${kmer1} --se ${reads1} ${reads2} --outdir ${assemblydir1} --name ${name1} --threads 2 --island 0 -c 1

transabyss -k ${kmer2} --se ${reads1} ${reads2} --outdir ${assemblydir2} --name ${name2} --threads 2 --island 0 -c 1

transabyss-merge --mink ${kmer1} --maxk ${kmer2} --prefixes k${kmer1}. k${kmer2}. --out ${mergedassembly} ${finalassembly1} ${finalassembly2}

#EOF


