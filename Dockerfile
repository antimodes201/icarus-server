FROM ubuntu:22.04
MAINTAINER antimodes201

# quash warnings
ARG DEBIAN_FRONTEND=noninteractive

ARG GAME_PORT=17777
ARG QUERY_PORT=27015


# Set some Variables
ENV BRANCH "public"
ENV TZ "America/New_York"
ENV NAME "Icarus Docker Server From T3stN3t"
ENV ADDITIONAL_ARGS ""
ENV GAME_PORT $GAME_PORT
ENV QUERY_PORT $QUERY_PORT

# dependencies
RUN dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
		lib32gcc-s1 \
		wget \
		unzip \
		wine \
		wine64 \
		xvfb \
		ca-certificates && \
		rm -rf /var/lib/apt/lists/*

# create directories
RUN adduser \
    --disabled-login \
    --disabled-password \
    --shell /bin/bash \
    steamuser && \
    usermod -G tty steamuser \
        && mkdir -p /app \
		&& mkdir -p /scripts \
        && chown steamuser:steamuser /app \
		&& chown steamuser:steamuser /scripts 

USER steamuser

ADD start.sh /scripts/start.sh

# Expose some port
EXPOSE $GAME_PORT/udp
EXPOSE $GAME_PORT/tcp
EXPOSE $QUERY_PORT/udp
EXPOSE $QUERY_PORT/tcp

# Make a volume
# contains configs and world saves
VOLUME /app

CMD ["/scripts/start.sh"]