#!/bin/bash

#SBATCH --partition=all-cpu
#SBATCH --qos=nogpu
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=clipper.sh
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kjf214@lehigh.edu

module load fastx-toolkit/0.0.14
export PATH=$PATH:/share/ceph/gil213group/shared/
clipper.sh
exit
