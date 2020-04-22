#!/bin/bash
echo "Running run.sh startup script"
declare -a configFiles=("settings.json" "broken.json" "float.log" "videos.json.backup" "videos.json" "partial.json")
#declare -a configFiles=("settings.json")
configDirectory="/Floatplane-Downloader/config"


exit_script(){
	clear
	echo "copying out config files (if new)"
	copy_config_files
}




# Setup the config directory, if not already created. This allows for out-of-docker testing
if [ ! -d $configDirectory ]; then
	mkdir -p $configDirectory
fi

arraylength=${#configFiles[@]}
# check if each of the above files exist in the correct location, if not link or copy them over

copy_config_files(){
for (( i=1; i<${arraylength}+1; i++ ));
do
	if [ ! -f $configDirectory/${configFiles[$i-1]} ]; then
		# currently the settings files do not exist, they need to be copied over
		if [ ! -f "/Floatplane-Downloader/${configFiles[$i-1]}" ]; then
			if [ -f $configDirectory/${configFiles[$i-1]} ]; then
				echo "Missing critical file '/Floatplane-Downloader/${configFiles[$i-1]}', you'l need this to run, creating it now"
				#echo "{}" > $configDirectory/${configFiles[$i-1]}
				ln -s $configDirectory/${configFiles[$i-1]} "/Floatplane-Downloader/${configFiles[$i-1]}"
			fi
		else
			# file exists, but not in the config directory; then link it back
			mv "/Floatplane-Downloader/${configFiles[$i-1]}" $configDirectory/${configFiles[$i-1]}
			ln -s $configDirectory/${configFiles[$i-1]} "/Floatplane-Downloader/${configFiles[$i-1]}"
		fi
	else
		# the file already exists in the config, so remove the local and link it
		if [ -f "/Floatplane-Downloader/${configFiles[$i-1]}" ]; then
			rm "/Floatplane-Downloader/${configFiles[$i-1]}"
		fi
		ln -s $configDirectory/${configFiles[$i-1]} "/Floatplane-Downloader/${configFiles[$i-1]}"
	fi

  #echo $i " / " ${arraylength} " : " ${array[$i-1]}
done
}
copy_config_files

trap exit_script 2 15 SIGINT SIGTERM
node float.js
