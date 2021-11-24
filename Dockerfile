FROM python:3.6

ARG VERSION
ARG BUILD_DATE

# Author
LABEL build_version="maxime1907 version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="maxime1907 <maxime1907.dev@gmail.com>"

WORKDIR /home/torchlight

# Install dependencies for Torchlight
RUN apt update && apt install -y youtube-dl ffmpeg
RUN useradd -m -d /home/torchlight torchlight

# Copy base project
COPY . /home/torchlight/

# Install GeoIP
COPY ./GeoIP/GeoLite2-City.mmdb /usr/share/GeoIP/

# install python dependency
RUN pip3 install -r requirements.txt

USER torchlight
CMD [ "python", "./main.py" ]
