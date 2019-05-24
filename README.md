# Floatplane-Downloader
If your like me and at the mercy of whatever speed of internet happens to be currently avaliable, then this is a handly little docker container to assist in getting the media from your Floatplane subscriptions dowloaded so that you can enjoy them.

# Basic Running 
### running the docker container
```
docker run -it --name FloatPlaneTest -v ~/videos:/Floatplane-Downlder/videos -v ~/config:/Floatplane-Downloader/config lymbada/floatplane-downloader
```

### Settings
There should be a single 'settings.json' config file located in the config location that you map. This is the file where all of the settings for the app can be configured, see the details on the orriginal GitHub project [inrixia/Floatplane-Downloader](https://github.com/Inrixia/Floatplane-Downloader) .

# Issues
Well this is only an initial build, currently the container runs, but you do need to manually configure the internal 'settings.json' file, because the commandline prompting doesn't work.