bcbio_nextgen.py -w template bcbio.yaml bcbio.csv SRS*.fastq.gz

cd bcbio/work

# symlinks
ln -s ../../bcbio_system.yaml .
ln -s ../../sbatch_bcbio.sh .

# slurm
less sbatch_bcbio.sh
sbatch sbatch_bcbio.sh
squeue -u $USER

less *.err
tree
