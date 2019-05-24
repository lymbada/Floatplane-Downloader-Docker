FROM node:10

MAINTAINER Matt T <lymbada@outlook.com>

# Install FFMpeg
RUN apt-get update && apt-get install -y ffmpeg

# Install / configure FloatPlane Script
RUN git clone https://github.com/Inrixia/Floatplane-Downloader.git /Floatplane-Downloader \
&& cd /Floatplane-Downloader \
&& npm install \
&& npm audit fix


#RUN curl --output /tmp/Install.zip https://raw.githubusercontent.com/Inrixia/Floatplane-Downloader/master/releases/Install.zip  \
# && unzip /tmp/Install.zip -d /tmp \
# && cd /tmp \
# && npm /tmp/install
#& unzip /tmp/Install.zip



VOLUME /Floatplane-Downloader/videos

ENTRYPOINT node /Floatplane-Downloader/float.js

CMD node /Floatplane-Downloader/float.js