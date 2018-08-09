#!/bin/bash

##
##  Example anonymization script. 
##  Place DICOM with PHI in the 'DICOM' directory
##  and it will write anonymized DICOM to 'DICOM-ANON'
## 

PLATFORM=`uname`
if [[ "$PLATFORM" == 'Darwin' ]]; then
	echo "Warning: MacOS supports a limited subset of DICOM transfer syntaxes due to lack of native Java ImageIO."
	echo "Pixel scrubbing will skip unsupported formats such as JPEG Lossless"
fi

# Helpful for debugging why pixel scrubbing is failing
#java -Dlog4j.configuration=file:log4j.xml -jar DAT/DAT.jar -n 4 \

java -jar DAT/DAT.jar -v -n 4 \
	-in DICOM \
	-out DICOM-ANON \
	-dec \
	-rec \
	-f filter.script \
	-da anonymizer.script \
	-dpa scrubber.script 
