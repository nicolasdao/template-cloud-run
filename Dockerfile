# Use the official lightweight Node.js 12 image.
# https://hub.docker.com/_/node
FROM node:12-slim

# UNCOMMENT THE FOLLOWING IF YOU NEED TO SETUP NPM TO USE PRIVATE GITHUB PACKAGES
# ARG GITHUB_PERSONAL_ACCESS_TOKEN

# Create and change to the app directory.
WORKDIR /usr/src/app

# UNCOMMENT THE FOLLOWING IF YOU NEED TO SETUP NPM TO USE PRIVATE GITHUB PACKAGES
# RUN echo "//npm.pkg.github.com/:_authToken=$GITHUB_PERSONAL_ACCESS_TOKEN" >> ~/.npmrc
# COPY .npmrc ./

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=prod

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD npm start
