# KMirrorTool-v3.sh
#

### Specify Folders ###

ConfDir="$(pwd)/config"
FuncDir="$(pwd)/functions"

### Perform Sanity Checks ###

# Config #

if [ ! -f $ConfDir ]; then
	echo "ERROR: config folder not found."
fi

if [ ! -f $FuncDir ]; then
	echo "ERROR: functions folder not found."
fi

### Source our configs ###
function SourceConfigs() {
	cd $ConfDir
	pwd
	for conf in *.conf; do
	    source *.conf
	done
	cd -

	echo " Configs Loaded"
}

### Next, we source our functions ###

function SourceFunctions() {
	cd $FuncDir
	pwd
	for func in *.bfunc; do
	    source *.bfunc
	done
	cd -

	echo "Functions Loaded."
}

### BLING Integration ###

### Cecho Integration ###

### Main Program ###
### TODO: How do we call all these functions without creating a mess of code here?
#	  Should each component have its own folder?  Then we call each folder with a for loop?
#

# SourceConfigs
# SourceFunctions

sh PreLoaderTest.sh

GetLatestKernelSources

DuplicateKernels
ExpiredKernels
RCKernels

