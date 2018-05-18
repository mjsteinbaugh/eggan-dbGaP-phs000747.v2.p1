bcbio_nextgen.py -w template bcbio-rnaseq.yaml bcbio.csv *.fastq.gz

cd bcbio-rnaseq/work

# symlinks
ln -s ../../bcbio_system.yaml .
ln -s ../../sbatch_bcbio.sh .

# slurm
less sbatch_bcbio.sh
sbatch sbatch_bcbio.sh
squeue -u $USER

less *.err
tree
