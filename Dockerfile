# VERSION:        0.2
# DESCRIPTION:    Image to build Atom

FROM ubuntu:20.04@sha256:b33325a00c7c27b23ae48cf17d2c654e2c30812b35e7846c006389318f6a71c2

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y \
        build-essential \
        git \
        libsecret-1-dev \
        fakeroot \
        rpm \
        libx11-dev \
        libxkbfile-dev \
        libgdk-pixbuf2.0-dev \
        libgtk-3-dev \
        libxss-dev \
        libasound2-dev \
        npm && \
    rm -rf /var/lib/apt/lists/*

# Update npm and dependencies
RUN npm install -g npm --loglevel error

# Use python2 by default
RUN npm config set python /usr/bin/python2 -g

ENTRYPOINT ["/usr/bin/env", "sh", "-c"]
CMD ["bash"]
