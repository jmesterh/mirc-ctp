#!/bin/bash

##
##  Example anonymization script for Mac which uses Docker for native ImageIO
##  Place DICOM with PHI in the 'DICOM' directory
##  and it will write anonymized DICOM to 'DICOM-ANON'
## 

# Helpful for debugging why pixel scrubbing is failing
#java -Dlog4j.configuration=file:log4j.xml -jar DAT/DAT.jar -n 4 \

docker run -v `pwd`:/tmp mirc-ctp -v -n 8 \
	-in /tmp/DICOM \
	-out /tmp/DICOM-ANON \
	-dec \
	-rec \
	-f /tmp/filter.script \
	-da /tmp/anonymizer.script \
	-dpa /tmp/scrubber.script 
