FROM ubuntu:24.04

ARG TZ=US
ARG DEBIAN_FRONTEND=noninteractive

ENV SEED_DATABASE=false

# Set the working directory
WORKDIR moonshot

# Install necessary system packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv

# Create a virtual environment
RUN python3 -m venv venv

RUN venv/bin/pip install --upgrade pip setuptools wheel

# Activate the virtual environment and install Python dependencies
COPY moonshot/requirements.txt .

RUN venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY moonshot .

# Migration and run server
COPY script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 8000

CMD ["/script.sh"]