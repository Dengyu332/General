#!/bin/bash

## move files

for number in 4069 4072 4073 4074 4075
do
cd /Volumes/Nexus/Electrophysiology_Data/DBS_Intraop_Recordings/DBS${number}/Anatomy
mv ./CT/preop/*/*/* ./CT/preop/
rm -r ./CT/preop/patient
mv ./CT/postop/*/*/* ./CT/postop/
rm -r ./CT/postop/patient

mv ./Fluoro/*/*/*/*.tif ./Fluoro/
rm -r ./Fluoro/Unnamed

mv ./MRI/preop/*/*/* ./MRI/preop/
rm -r ./MRI/preop/patient
done