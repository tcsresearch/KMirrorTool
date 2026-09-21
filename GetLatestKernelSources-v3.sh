echo "Kernel Fetcher v 0.3 - (c) 2024 TCS Research.  All Rights Reserved."
echo " "


#####----- BEGIN Colors -----#####
KFetch_ColorsFile="./config/Colors.conf"

function SourceColorsFile() {
	if [ ! -f "$KFetch_ColorsFile" ]; then
		echo "ERROR!  Colors File Not Found."
		return 1
	else
		source "$KFetch_ColorsFile"
	fi
}

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
		# echo "#####     Fetching Latest Kernel From Repo: ${i}...    #####"
		echo "${brightyellow} #####-----Fetching Latest Kernel From Repo: ${blue} ${i} ${brightyellow} ----- ##### ${reset} "
		cd $i > /dev/null
		# sh Update.sh
		# May be redundant entry for repo: updates
		dnf download --source kernel --enablerepo=$i
		# echo "#####     Sucessfully Fetched Latest Kernel From Repo: ${i}.     #####"
		echo "${brightyellow} #####-----Successfully Fetched Latest Kernel From Repo:${blue} ${i}. ${brightyellow} ----- ##### {$reset} "
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
	
	SourceColorsFile
	EnterKDir
	FetchKernels
	ExitKDir

