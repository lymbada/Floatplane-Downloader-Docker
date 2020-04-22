FROM node:10

MAINTAINER Matt T <lymbada@outlook.com>

# Install FFMpeg
RUN apt-get update && apt-get install -y ffmpeg \
 && apt-get clean && apt-get autoremove --yes && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download the FP installer
RUN git clone https://github.com/Inrixia/Floatplane-Downloader.git /FP-Install \
&& mkdir /Floatplane-Downloader/ \
&& cp /FP-Install/releases/installers/* /Floatplane-Downloader/. \
&& rm -r /FP-Install

# Use included installer
WORKDIR /Floatplane-Downloader
RUN npm install && npm audit fix 
RUN node install.js \
&& npm update \
&& rm install.js && rm install.bat
RUN cp -r ./node_modules/m3u8stream/dist ./node_modules/m3u8stream/lib

VOLUME /Floatplane-Downloader/videos
VOLUME /Floatplane-Downloader/config

COPY ./run.sh /Floatplane-Downloader/

ENTRYPOINT /Floatplane-Downloader/run.sh
WORKDIR /Floatplane-Downloader
CMD /Floatplane/run.sh
