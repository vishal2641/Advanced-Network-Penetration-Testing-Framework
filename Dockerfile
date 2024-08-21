FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic dependencies
RUN apt-get update && \
    apt-get install -y curl wget gnupg2 lsb-release software-properties-common

# Install Metasploit
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall

# Add GVM repository
RUN add-apt-repository -y ppa:mrazavi/gvm && \
    apt-get update && \
    apt-get install -y gvm

# Install Python dependencies
RUN apt-get install -y python3-pip && \
    pip3 install jinja2

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Default command to run the framework
CMD ["python3", "framework/core/scan.py"]
