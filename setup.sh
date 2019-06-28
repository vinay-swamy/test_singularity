#!/bin/bash
git clone https://github.com/bcgsc/transabyss
mv transabyss/transabyss transabyss/tranabyss.py
mv transabyss/tranabyss-merge transabyss/transabyss-merge.py
sudo singularity build transabyss.simg transabyss_container.def
