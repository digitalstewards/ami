# Bases the image on Ubuntu 16.04 (since 18.04 is still not available)
FROM ubuntu:16.04

# Basic update/upgrade mechanism + installs necessary packages
RUN apt update && \
    apt upgrade -y && \
    apt install apt-transport-https ca-certificates nodejs npm -y

# Install Bower & Grunt using npm
RUN npm install -g bower grunt-cli

# Defines the default work directory
WORKDIR /data

# Copies AMI files to the desired directory
COPY . /data

# Defines the default command to be run once container is up and running.
# It will probably make sense to have "run.sh" which will actually define these.
CMD ["nodejs", "-v"]
