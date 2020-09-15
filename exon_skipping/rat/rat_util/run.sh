#!/bin/bash
#SBATCH -p long
#SBATCH --job-name=rat_exonskipping
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=lindsey.broadwell@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=30:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err
pwd; hostname; date
echo "You've requested $SLURM_CPUS_ON_NODE core."
module load singularity/3.1.1
nextflow run nf-core/rnaseq -r 1.4.2 \
-resume \
-profile singularity \
--singleEnd \
--reads 'fastq/*.fastq' \
--fasta genome/Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa \
--gtf util/Rattus_norvegicus.Rnor_6.0.100.gtf \
--pseudo_aligner salmon \
-c nextflow.config

date
