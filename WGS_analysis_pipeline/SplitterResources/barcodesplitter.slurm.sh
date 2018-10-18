#!/bin/bash

#SBATCH --partition=all-cpu
#SBATCH --qos=nogpu
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --job-name=barcodesplitter.sh
#SBATCH --mail-type=ALL
#SBATCH --mail-user=swb215@lehigh.edu

module load anaconda/bioinformatics
export PATH=$PATH:/share/ceph/gil213group/shared/
barcodesplitter.sh
exit
