#!/bin/bash

cd buildroot
make spice-rack-app-dirclean
make SPICE_RACK_APP_OVERRIDE_SRCDIR=/home/geoffreyjensen/Desktop/ECEA5307/final-project-spice-rack-app spice-rack-app-rebuild
make SPICE_RACK_APP_OVERRIDE_SRCDIR=/home/geoffreyjensen/Desktop/ECEA5307/final-project-spice-rack-app

