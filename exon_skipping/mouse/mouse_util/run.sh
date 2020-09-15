#!/bin/bash
#SBATCH -p long
#SBATCH --job-name=myh7b-rnaseq
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lile5118@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=30:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err
pwd; hostname; date
echo "You've requested $SLURM_CPUS_ON_NODE core."
module load singularity/3.1.1
nextflow run nf-core/rnaseq -r 1.4.1 \
-resume \
-profile singularity \
--reads 'fastq/*{_1,_2}.fq.gz' \
--fasta /scratch/Users/lile5118/reference_genomes/Mus_musculus/Gencode/vM23/sequence/GRCm38.p6.genome.fa \
--gtf /scratch/Users/lile5118/reference_genomes/Mus_musculus/Gencode/vM23/annotation/gencode.vM23.annotation.gtf \
--pseudo_aligner salmon \
--gencode \
--email lile5118@colorado.edu \
-c nextflow.config
date
