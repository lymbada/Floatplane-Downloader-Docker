# Floatplane-Downloader
If your like me and at the mercy of whatever speed of internet happens to be currently avaliable, then this is a handly little docker container to assist in getting the media from your Floatplane subscriptions dowloaded so that you can enjoy them.

# Basic Running
### running the docker container
```
docker run -it --name FloatPlaneTest -v ~/videos:/Floatplane-Downlder/videos -v ~/config:/Floatplane-Downloader/config lymbada/floatplane-downloader
```

### Settings
There should be a single 'settings.json' config file located in the config location that you map. This is the file where all of the settings for the app can be configured, see the details on the orriginal GitHub project [inrixia/Floatplane-Downloader](https://github.com/Inrixia/Floatplane-Downloader) .

### Authentication
While the initial script from Inrixia does do some auth, this is not (currently) used in the docker image. It is required that you add your username & password directly into the settings.json file (down near the bottom of the file).

# Issues
Well this is only an initial build, currently the container runs, but you do need to manually configure the internal 'settings.json' file, because the commandline prompting doesn't work.

## Version
Autobuild should have the latest build at the time that the particular last update was made. Versions are also supported where the GitHub tag = "version-(version)"
