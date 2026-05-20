#!/usr/bin/env bash

# Last Updated: Wed May 20 2026

# find is the common tool for this kind of task :

### Define Variables ###
ExpiryFolder='$(pwd)/_Kernels' # TESTING!
ExpiryTime='30' # Specify in days

### Functions ###

function DisplayLine() {
	echo "__________________________________________________________________________________________"
}

function NewLine() {
	echo " "
}

function DisplayBanner() {
	DisplayLine
	NewLine
	echo "Kernel Mirror Expiry Tool - v0.1 - (c) TCS Research. All Rights Rserved."
	NewLine
	# echo "ExpiryFolder: $ExpiryFolder"
	# DisplayLine
	# NewLine
	echo "ExpiryTime ( # of days ): $ExpiryTime"
	NewLine
	DisplayLine
}

function EnterKDir() {
	NewLine
        echo "Entering Kernels Directory..."
        # cd _Kernels || return
        cd $ExpiryFolder || return # New Testing May 2026.
		pwd
}

function ExitKDir() {
	NewLine
        echo "Reverting to Main User Folder..."
        cd - || return
        ## pwd
}


function SanityCheck_FolderExists() {
	if [ ! -d "$ExpiryFolder" ]; then
		echo "ERROR: $ExpiryFolder not found...exiting."
		#exit 1
		return # Using 'return instead of 'exit'
	fi
}

#########################################################################################################################################
# Find Expired Files #																													#
#########################################################################################################################################

function GenerateExpiredKernelsListFile() {  ## This may be a redundant function to FindExpiredKFiles().
        # Use repos.list ?

        ### Original Working Code Concept
        # find ./my_dir -mtime +10 -type f -delete

        for i in "$(cat repos.list)";  do
                # for kernel in updates updates-testing rawhide do; {
                echo " "
                echo "#####     Searching For Expired Kernels From Repo: ${i}...    #####"
                cd "$i" > /dev/null || return # Added double pipe return to fix SC2164
                # find $i -mtime +$ExpiryTime -type f -delete
                # find -mtime +$ExpiryTime -type f | grep .src.rpm > ExpiredKernels.list
                echo "Displaying List Of Expired Kernels Before Deletion:"
                cat ExpiredKernels.list
        }



function FindExpiredKFiles() {
	for i in "$(cat repos.list)";  do
                  # for kernel in updates updates-testing rawhide do; {
                  echo " "
                  echo "#####     Generating List Of Expired Kernels From Repo: ${i}...    #####"
                  cd "$i" > /dev/null || return # Added double pipe return to fix SC2164
                  # find $i -mtime +$ExpiryTime -type f
		  find -mtime +$ExpiryTime -type f | grep .src.rpm > ExpiredKernels.list
		  # echo "#####     List Generated From Repo: ${i}.     #####"
                  echo " "
		  # echo "Displaying List Of Expired Kernels:"
                  cat ExpiredKernels.list
		  cd - > /dev/null || return # Added double pipe return to fix SC2164
                  echo " "
          done
 
}

#########################################################################################################################################
# Pre-Deletion Confirmation #																											#
#########################################################################################################################################

## Added Confirmation Y/N Function
ConfirmYN() {
    while true; do
        read -p "$1 [y/n]: " yn
        case $yn in
            [Yy]* ) return 0;; # Success
            [Nn]* ) return 1;; # Failure/No
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Usage:
if ConfirmYN "Do you wish to delete expired kernels now?"; then
    echo "Proceeding..."  ### TODO: Make this run the correct function.
	DoExpiryDeletion4
else
    echo "Aborted."  ## TODO: Ensure this correctly aborts.
    return # Using 'return' rather than 'exit'.
fi



#########################################################################################################################################
# Expiry Deletion #																														#
#########################################################################################################################################

## TODO: Are DoExpiryDeletion() and DoExpiryDeletion2() the same?
function DoExpiryDeletion() {
	# Use repos.list ?

	### Original Working Code Concept
	# find ./my_dir -mtime +10 -type f -delete

        for i in "$(cat repos.list)";  do
                # for kernel in updates updates-testing rawhide do; {
                echo " "
                echo "#####     Preparing To Purge Expired Kernels From Repo: ${i}...    #####"
                cd "$i" > /dev/null || return # Added double pipe return to fix SC2164
		# find $i -mtime +$ExpiryTime -type f -delete
		### find -mtime +$ExpiryTime -type f | grep .src.rpm > ExpiredKernels.list
		echo "Displaying List Of Expired Kernels Before Deletion:"
		cat ExpiredKernels.list
		echo "Do you wish to delete expired kernels now?"
		# TODO: Insert wait command with input request here.
		rm -v `cat ExpiredKernels.list`
		echo "#####     Sucessfully Purged Expired Kernels From Repo: ${i}.     #####"
                cd - > /dev/null || return # Added double pipe return to fix SC2164
                echo " "
        done
}

function DoExpiryDeletion2() {
        # Use repos.list ?

        ### Original Working Code Concept
        # find ./my_dir -mtime +10 -type f -delete

        for i in "$(cat repos.list)";  do
                # for kernel in updates updates-testing rawhide do; {
                echo " "
                echo "#####     Purging Expired Kernels From Repo: ${i}...    #####"
                cd "$i" > /dev/null || return # Added double pipe return to fix SC2164
                # find $i -mtime +$ExpiryTime -type f -delete
                # find -mtime +$ExpiryTime -type f | grep .src.rpm > ExpiredKernels.list
                echo "Displaying List Of Expired Kernels Before Deletion:"
                cat ExpiredKernels.list
                echo "Do you wish to delete expired kernels now?"
                # TODO: Insert wait command with input request here.
                rm -v "$(cat ExpiredKernels.list)"
                echo "#####     Sucessfully Purged Expired Kernels From Repo: ${i}.     #####"
		rm -f ExpiredKernels.list
                cd - > /dev/null || return # Added double pipe return to fix SC2164
                echo " "
        done
}


		function DoExpiryDeletetion4() {
				rm -iv "$(cat ExpiredKernels.list)" # Added -iv vs -v for added sanity checking during testing.
                echo "#####     Sucessfully Purged Expired Kernels From Repo: ${i}.     #####"
		rm -f ExpiredKernels.list
                cd - > /dev/null || return # Added double pipe return to fix SC2164
                echo " "
        done
}

#############################################################################################################
#### README ###																								#
#############################################################################################################
# EXPLANATIONS #

#    ./my_dir your directory (replace with your own)
#    -mtime +10 older than 10 days
#    -type f only files
#    -delete no surprise. Remove it to test your find filter before executing the whole command

# And take care that ./my_dir exists to avoid bad surprises !


#### Main Program ###

DisplayBanner
## SanityCheck_FolderExists
EnterKDir
FindExpiredKFiles
### TAKE CAUTION Running Below Function!!!
#
ConfirmYN
## DoExpiryDeletion4
#
ExitKDir

