#!/bin/bash

## automatically create folders

for number in {4069..4075}
do
cd /Volumes/Nexus/Electrophysiology_Data/DBS_Intraop_Recordings
mkdir ./DBS${number}/Anatomy
mkdir ./DBS${number}/Anatomy/MRI
mkdir ./DBS${number}/Anatomy/CT
mkdir ./DBS${number}/Anatomy/Fluoro
cd ./DBS${number}/Anatomy/CT
mkdir preop intraop postop
cd ..
cd ./MRI
mkdir preop postop
done