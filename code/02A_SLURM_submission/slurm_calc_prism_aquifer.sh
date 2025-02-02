#!/bin/bash

#SBATCH --job-name=calc_prism_aquifer
#SBATCH --error=calc_prism_aquifer.error
#SBATCH --mail-user=songi2@nih.gov
#SBATCH --mail-type=END,FAIL
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=768g
#SBATCH --partition=highmem

## apptainer
# apptainer exec --writable-tmpfs --mount='type=bind,source=/opt,destination=/ddn/gs1/home/songi2/projects/PrestoGP_Pesticides/code' /ddn/gs1/home/songi2/images/rocker_base_computation.sif Rscript /ddn/gs1/home/songi2/projects/PrestoGP_Pesticides/Calc_WBD.r

apptainer exec \
    --writable-tmpfs \
    --mount type=bind,source=/ddn/gs1/group/set/Projects/PrestoGP_Pesticides/input,destination=/opt \
    --mount type=bind,source=/ddn/gs1/home/songi2/projects/PrestoGP_Pesticides/output,destination=/mnt \
    /ddn/gs1/group/set/Projects/PrestoGP_Pesticides/input/Rspatial_container/rocker_base_computation.sif Rscript /ddn/gs1/home/songi2/projects/PrestoGP_Pesticides/code/02_Geographic_Covariates/Calc_aquifer_prism.r
