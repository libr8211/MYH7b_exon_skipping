#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=download-sra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lindsey.broadwell@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=10gb
#SBATCH --time=20:00:00
#SBATCH --output=fastp.out
#SBATCH --error=fastp.err

module load fastp

for f1 in ../fastq/*_1.fastq
do
        f2=${f1%%_1.fastq}"_2.fastq"
        fastp -i $f1 -I $f2 -o "out-$f1" -O "out-$f2"
done
