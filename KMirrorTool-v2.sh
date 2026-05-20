#!/usr/bin/env bash

### First, source our configs ###

function KMT_SourceConfigs() {
	shopt -s nullglob	# prevents literal matches if no files exist.
	for conf in config/*.conf do
		source "$conf"
	done

	echo " Configs Loaded"
}

### Next, we source our functions ###
function KMT_SourceFunctions() {
	shopt -s nullglob	# prevents literal matches if no files exist.
	for func in functions/*.bfunc do
		source "$bfunc"
	done

	echo "Functions Loaded."
}

### Source Configs & Functions ###
	KMT_SourceConfigs
	KMT_SourceFunctions

### BLING Integration ###

### Cecho Integration ###

### Main Program ###
### TODO: How do we call all these functions without creating a mess of code here?
#	  Should each component have its own folder?  Then we call each folder with a for loop?
#
	GetLatestKernelSources
	DuplicateKernels
ExpiredKernels
RCKernels
