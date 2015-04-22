#!/bin/bash

#PBS -N depth_extract
#PBS -S /bin/bash
#PBS -l walltime=48:00:00
#PBS -l nodes=1:ppn=4
#PBS -l mem=4gb
#PBS -j oe
#PBS -o depth_extract.out

module load perl

cd code

perl depth_extract.pl