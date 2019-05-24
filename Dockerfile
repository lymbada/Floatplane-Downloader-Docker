FROM node:10

MAINTAINER Matt T <lymbada@outlook.com>

# Install FFMpeg
RUN apt-get update && apt-get install -y ffmpeg \
 && apt-get clean && apt-get autoremove --yes && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install / configure FloatPlane Script
RUN git clone https://github.com/Inrixia/Floatplane-Downloader.git /Floatplane-Downloader \
&& cd /Floatplane-Downloader \
&& npm install \
&& npm audit fix

VOLUME /Floatplane-Downloader/videos

ENTRYPOINT node /Floatplane-Downloader/float.js
WORKDIR /Floatplane-Downloader
CMD node float.js