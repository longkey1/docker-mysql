FROM mysql:5.6

# Fix frontend not set error
ARG DEBIAN_FRONTEND=noninteractive

# Install gosu
RUN apt-get -y update && apt-get -y install gosu

# Install dependency packages
RUN apt-get -y update && apt-get -y install openssh-client

# Make working directory
ENV WORK_DIR=/work
RUN mkdir ${WORK_DIR}

# Set Entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Confirm mysql version
RUN mysql --version
