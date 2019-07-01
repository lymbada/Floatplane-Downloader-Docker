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

COPY ./run.sh /Floatplane-Downloader/

VOLUME /Floatplane-Downloader/videos
VOLUME /Floatplane-Downloader/config

ENTRYPOINT /Floatplane-Downloader/run.sh
WORKDIR /Floatplane-Downloader
CMD /Floatplane/run.sh
