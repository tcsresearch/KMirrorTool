echo "Kernel Fetcher v 0.2 - (c) 2024 TCS Research.  All Rights Reserved."
echo " "

#####----- BEGIN Functions -----#####

function EnterKDir() {
	echo "Entering Kernels Directory..."
	cd _Kernels
	pwd
}

function FetchKernels() {
	for i in $(cat repos.list);  do
		# for kernel in updates updates-testing rawhide do; {
		echo " "
		echo "#####     Fetching Latest Kernel From Repo: ${i}...    #####"
		cd $i > /dev/null
		# sh Update.sh
		# May be redundant entry for repo: updates
		dnf download --source kernel --enablerepo=$i
		echo "#####     Sucessfully Fetched Latest Kernel From Repo: ${i}.     #####"
		cd - > /dev/null
		echo " "
	done
}

function ExitKDir() {

	echo "Reverting to Main User Folder..."
	cd -
	## pwd
}

#####----- END Functions -----#####

#####----- Main Program -----#####

	EnterKDir
	FetchKernels
	ExitKDir

