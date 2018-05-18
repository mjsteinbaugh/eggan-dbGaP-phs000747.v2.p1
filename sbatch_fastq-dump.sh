#!/bin/bash

# SLURM
# https://slurm.schedmd.com/sbatch.html

#SBATCH --job-name=dbGaP-16400         # Job name
#SBATCH --partition=general            # Partition name
#SBATCH --time=3-00:00                 # Runtime in D-HH:MM format
#SBATCH --nodes=1                      # Number of nodes (keep at 1)
#SBATCH --ntasks=1                     # Number of tasks per node (keep at 1)
#SBATCH --cpus-per-task=1              # CPU cores requested per task (change for threaded jobs)
#SBATCH --mem-per-cpu=8G               # Memory needed per CPU
#SBATCH --error=jobid_%j.err           # File to which STDERR will be written, including job ID
#SBATCH --output=jobid_%j.out          # File to which STDOUT will be written, including job ID
#SBATCH --mail-type=ALL                # Type of email notification (BEGIN, END, FAIL, ALL)

# Activate conda environment to load sra-tools (fastq-dump)
# conda activate ngs

while read accession; do
    if [[ ! -e ${accession}.fastq.gz ]] && [[ ! -e ${accession}_1.fastq.gz ]]; then
        echo "$accession"
        fastq-dump --gzip --split-3 "$accession"
    fi
done < SRR_Acc_List.txt

