#!/bin/bash

set -euo pipefail

cd $(dirname $0)

kmer1=25
kmer2=32
name1=gekko.k${kmer1}
name2=gekko.k${kmer2}
reads1=$1
reads2=$2
assemblydir1=./${name1}
assemblydir2=./${name2}
finalassembly1=${assemblydir1}/${name1}-final.fa
finalassembly2=${assemblydir2}/${name2}-final.fa
mergedassembly=$3
threads=$(grep -c ^processor /proc/cpuinfo)


python transabyss/transabyss.py -k ${kmer1} --se ${reads1} ${reads2} --outdir ${assemblydir1} --name ${name1} --threads $threads --island 0 -c 1

python transabyss/transabyss.py -k ${kmer2} --se ${reads1} ${reads2} --outdir ${assemblydir2} --name ${name2} --threads $threads --island 0 -c 1

python transabyss/transabyss-merge.py --mink ${kmer1} --maxk ${kmer2} --prefixes k${kmer1}. k${kmer2}. --out ${mergedassembly} ${finalassembly1} ${finalassembly2}
