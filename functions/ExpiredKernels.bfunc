

# find is the common tool for this kind of task :

### Define Variables ###
ExpiryFolder='.my_dir' # Change This!
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
        cd _Kernels
        pwd
}

function ExitKDir() {
	NewLine
        echo "Reverting to Main User Folder..."
        cd -
        ## pwd
}


function SanityCheck_FolderExists() {
	if [ ! -d $ExpiryFolder ]; then
		echo "EREOR: $ExpiryFolder not found...exiting."
		exit 1
	fi
}

function DoExpiryDeletion() {
	# Use repos.list ?

	### Original Working Code Concept
	# find ./my_dir -mtime +10 -type f -delete

        for i in $(cat repos.list);  do
                # for kernel in updates updates-testing rawhide do; {
                echo " "
                echo "#####     Purging Expired Kernels From Repo: ${i}...    #####"
                cd $i > /dev/null
		# find $i -mtime +$ExpiryTime -type f -delete
		### find -mtime +$ExpiryTime -type f | grep .src.rpm > ExpiredKernels.list
		echo "Displaying List Of Expired Kernels Before Deltion:"
		cat ExpiredKernels.list
		echo "Do you wish to delete expired kernels now?"
		# Insert wait command with input request here.
		rm -v `cat ExpiredKernels.list`
		echo "#####     Sucessfully Purged Expired Kernels From Repo: ${i}.     #####"
                cd - > /dev/null
                echo " "
        done
}

function DoExpiryDeletion2() {
        # Use repos.list ?

        ### Original Working Code Concept
        # find ./my_dir -mtime +10 -type f -delete

        for i in $(cat repos.list);  do
                # for kernel in updates updates-testing rawhide do; {
                echo " "
                echo "#####     Purging Expired Kernels From Repo: ${i}...    #####"
                cd $i > /dev/null
                # find $i -mtime +$ExpiryTime -type f -delete
                # find -mtime +$ExpiryTime -type f | grep .src.rpm > ExpiredKernels.list
                echo "Displaying List Of Expired Kernels Before Deltion:"
                cat ExpiredKernels.list
                echo "Do you wish to delete expired kernels now?"
                # Insert wait command with input request here.
                rm -v `cat ExpiredKernels.list`
                echo "#####     Sucessfully Purged Expired Kernels From Repo: ${i}.     #####"
		rm -f ExpiredKernels.list
                cd - > /dev/null
                echo " "
        done
}


function FindExpiredKFiles() {
	for i in $(cat repos.list);  do
                  # for kernel in updates updates-testing rawhide do; {
                  echo " "
                  echo "#####     Generating List Of Expired Kernels From Repo: ${i}...    #####"
                  cd $i > /dev/null
                  # find $i -mtime +$ExpiryTime -type f
		  find -mtime +$ExpiryTime -type f | grep .src.rpm > ExpiredKernels.list
		  # echo "#####     List Generated From Repo: ${i}.     #####"
                  echo " "
		  # echo "Displaying List Of Expired Kernels:"
                  cat ExpiredKernels.list
		  cd - > /dev/null
                  echo " "
          done
 
}

#### README ###

# EXPLANATIONS

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
## DoExpiryDelettion2
#
ExitKDir

