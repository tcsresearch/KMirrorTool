### First, source our configs ###

for $conf in config/*.conf do
	source *.bfunc
done

echo " Configs Loaded"

### Next, we source our functions ###

for $func in functions/*.bfunc do
	source *.bfunc
done

echo "Functions Loaded."

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
