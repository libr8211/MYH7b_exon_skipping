#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=download-sra
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lindsey.broadwell@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=10gb
#SBATCH --time=20:00:00
#SBATCH --output=ttf.out
#SBATCH --error=ttf.err

date
hostname

module load stringtie
gffread -w transcripts.fa -g ../genome/Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa Rattus_norvegicus.Rnor_6.0.100.gtf
