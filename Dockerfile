FROM balenalib/raspberrypi3-python:3.6.6-stretch-build-20181207

RUN apt update && \
    apt install -y --no-install-recommends \
	    dnsmasq \
	    git && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
RUN git clone https://github.com/OpenAgricultureFoundation/python-wifi-connect.git

WORKDIR /usr/src/app/python-wifi-connect
EXPOSE 80

RUN ./scripts/install.sh
COPY setting.sh ./scripts/
CMD ["bash", "./scripts/setting.sh"]
# RUN sed -i -e "2i export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket" ./scripts/run.sh
# RUN ./scripts/run.sh
