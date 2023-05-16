#!/bin/bash

if [ -d buildroot ]
then
	cd buildroot
	echo "Running make distclean"
	make distclean
else
	echo "buildroot directory doesn't exist"
fi

