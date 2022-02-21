#!/bin/bash

##########################################
## Middleware All in One deployment script
## Author: lukacsr1
## Date: 2022.02.11
## Version: v0.0.12
##########################################

##########################################
# variables layer
mwctlHome="F:\Project\mwctl\idomsoft_mwctl"
playbooksHome="$mwctlHome/playbooks"
toolsHome="$mwctlHome/tools"
functionsHome="$mwctlHome/functions"
applicationsHome="$mwctlHome/apps"
logsHome="$mwctlHome/logs"

date=$(date +"%Y-%m-%d %H:%M:%S,%3N")
logDate=$(date +"%Y%m%d")
username="`whoami`";
pid=$$

project=$2
application=$4
enviroment=$6
searchValue="$4"_"$6"
paramlist="$1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13"

##########################################
# source layer
source $functionsHome/file_functions
source $functionsHome/dir_functions
source $functionsHome/main_functions
source $functionsHome/log_functions

##########################################
# application layer

### Definite the log name
log.logFileName $paramlist

### Start of logging
log.loggingStart

### Check parameters
main.parametercheck $paramlist

### Check csv file is exists
file.exists $toolsHome/apps.csv

### If you want list of available projects or project apps
if [ "$1" == "-gp" ] || [ "$1" == "-getprojects" ]; then
	echo "[INFO] Get all projects"
	main.getprojects 
elif [ "$1" == "-gpa" ] || [ "$1" == "-getprojectapps" ]; then
	echo "[INFO] Get project all apps"
	main.getprojectapps $1 $2 
fi

### Check app local dir is exists
main.checkappdir $paramlist

### Check available methods
main.availabletypes $paramlist

### End of logging
log.loggingEnd
