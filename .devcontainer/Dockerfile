# Use the official Ubuntu image as the base image
FROM ubuntu:20.04

# Set non-interactive frontend for apt-get to avoid regional settings prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install Node.js and npm from the official Ubuntu repositories
RUN apt-get update && apt-get install -y \
    curl \
    maven \
    openjdk-21-jdk-headless \
    git \
    && apt-get clean

# Set the working directory
WORKDIR /usr/src/app

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
#EXPOSE 8080

# Command to build the application
CMD ["mvn", "install"]
