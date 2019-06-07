FROM balenalib/raspberrypi3-python:3.6.6-stretch-build-20181207

RUN export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

RUN apt update && \
    apt install -y --no-install-recommends \
	    git && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

RUN git clone https://github.com/OpenAgricultureFoundation/python-wifi-connect.git

WORKDIR /usr/src/app/python-wifi-connect

RUN echo $DBUS_SYSTEM_BUS_ADDRESS

CMD ["which", "nmcli"]
RUN ./scripts/install.sh
RUN ./scripts/run.sh
