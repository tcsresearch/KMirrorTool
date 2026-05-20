#!/usr/bin/env bash

# Kernel Mirror Cleaning Tool #
#
# TODO
# 	Enable ColorEcho / BLING
#	

# Define our variables.
RCKFolder='_Kernels/rawhide'
bls='ls -1' 
# RCKList='rc-kernels.list'
CurrentFolder=$(pwd)

### BEGIN Functions ###

function SanityCheck_DoesListExist() {
        if [ ! -f RCKList ]; then
                echo "ERROR: RCKList File not found...exiting."
                exit 1
        fi
}

function DeleteList() {
	if [ -f RCKList ]; then
		rm -f RCKList
	fi
}

function CreateTestFiles() {
	touch kernel-7.7.555-64.rc2.fc89.src.rpm
	touch kernel-7.7.557-64.rc3.fc89.src.rpm
	touch kernel-7.7.559-64.rc4.fc89.src.rpm
}


function DisplayBanner() {
	echo "Kernel Maintenence Tool.  (c) 2024 TCS Research.  All Rights Reserved."
	echo " "
	echo "RCKFolder: $RCKFolder"
	echo " "
}





function DoGrepKernels3() {
	echo "Entering $RCKFolder..."
	cd "$RCKFolder" || return
        echo "Generating list of -rc Kernels..."
        $bls  | grep rc0 > RCKList # Establish new file.
        $bls  | grep rc1 >> RCKList
        $bls  | grep rc2 >> RCKList
        $bls  | grep rc3 >> RCKList
        $bls  | grep rc3 >> RCKList
        $bls  | grep rc4 >> RCKList
        $bls  | grep rc5 >> RCKList
        $bls  | grep rc6 >> RCKList
        $bls  | grep rc7 >> RCKList
        $bls  | grep rc8 >> RCKList
        $bls  | grep rc9 >> RCKList # Likely not needed.
        echo "List of RC Kernels Generated.  Displaying Contents.."
        cat RCKList
}



function DoGrepKernels4() {
	> RCKList # Creates a new file or overwrites the existing one

	# Loop through rc0 to rc3 and append matches to the file
	for i in {0..9}; do
  		$bls | grep "rc$i" >> RCKList
	done
}


function RevertFolder() {
	echo "Reverting to main program folder..."
	cd - || return
	echo " "
}

function DeleteRCKernels() {
	echo "Current Folder: $CurrentFolder"
	echo "Deleteing RC Kernels..."
	rm -fv "$(cat RCKList)"
	echo "Finished removal of RC Kernels."
}

### END Functions ###


### Main Program ###
DisplayBanner
# DoGrepKernels3
DoGrepKernels4
SanityCheck_DoesListExist
DeleteRCKernels
DeleteList
RevertFolder
# CreateTestFiles
