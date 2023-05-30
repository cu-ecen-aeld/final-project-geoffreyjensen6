#!/bin/bash

cd buildroot
make fsr-dirclean
make FSR_OVERRIDE_SRCDIR=/home/geoffreyjensen/Desktop/ECEA5307/final-project-fsr-driver fsr-rebuild
make FSR_OVERRIDE_SRCDIR=/home/geoffreyjensen/Desktop/ECEA5307/final-project-fsr-driver

