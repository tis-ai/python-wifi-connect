FROM balenalib/raspberrypi3-python:3.6.6-stretch-build-20181207

RUN apt update && \
    apt install -y --no-install-recommends \
	    git && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

RUN git clone https://github.com/OpenAgricultureFoundation/python-wifi-connect.git

WORKDIR /usr/src/app/python-wifi-connect

RUN pip install --upgrade pip
RUN python -m venv venv
CMD ["source", "venv/bin/activate"]
RUN ls
RUN pip install -r config/requirements.txt
RUN ./scripts/run.sh
