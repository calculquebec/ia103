#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --gpus-per-task=1
#SBATCH --cpus-per-task=1  
#SBATCH --mem=6000M       
#SBATCH --time=0-00:05
#SBATCH --output=%N-%j.out

module load python/3.12 opencv/4.13

export HF_HUB_OFFLINE=1
export TRANSFORMERS_OFFLINE=1

#virtualenv --no-download $SLURM_TMPDIR/env
source /localscratch/instructor3.93.0/env/bin/activate
#pip install --no-index vllm
#pip install -r ~/vllm-requiremnts.txt --no-index

python vllm-example.py
