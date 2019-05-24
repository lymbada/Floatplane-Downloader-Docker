#!/bin/bash
echo "Running run.sh startup script"
if [ ! -f /Floatplane-Downloader/config/settings.json ]; then
	echo "No file, now copying settings file"
	cp /Floatplane-Downloader/settings.json /Floatplane-Downloader/config/settings.json
fi

if [ -f /Floatplane-Downloader/settings.json ]; then
	rm /Floatplane-Downloader/settings.json
fi

ln -s /Floatplane-Downloader/config/settings.json /Floatplane-Downloader/settings.json

 node float.js