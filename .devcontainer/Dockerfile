# Use the official Ubuntu image as the base image
FROM ubuntu:20.04

# Set non-interactive frontend for apt-get to avoid regional settings prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install Node.js and npm from the official Ubuntu repositories
RUN apt-get update && apt-get install -y \
    nodejs \
    npm

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
