FROM balenalib/raspberrypi3-python:3.6.6-stretch-run-20181207

RUN apt update && \
    apt install -y --no-install-recommends \
	    git && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

RUN git clone https://github.com/OpenAgricultureFoundation/python-wifi-connect.git

WORKDIR /usr/src/app/python-wifi-connect

RUN pip install --upgrade pip && \
    ./scripts/install.sh && \
    ./scripts/run.sh
