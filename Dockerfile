# The first line takes the official Node version 5 image from Docker Hub,
# prebuilt on top of Debian Jessie as a starting point
FROM node:5

# Because Docker images can be pushed to Docker Hub and shared with other
# people, putting your name and email address in there is always a good
# practice.
MAINTAINER th3mon <p.szelenberger@gmail.com>

# To tell Node.js that this is a development image, let’s set the NODE_ENV
# environment variable to development
ENV NODE_ENV=development

# Base folder inside the image for Docker to put files in.
WORKDIR /usr/local/src

# Copying files from the local file system to the image.
COPY package.json /usr/local/src/package.json

# Install the dependencies.
RUN npm install

# Copy source files and start compiling with Gulp.
COPY gulpfile.js /usr/local/src/gulpfile.js
COPY .babelrc /usr/local/src/.babelrc
COPY src /usr/local/src/src
RUN npm run compile

# By default, Docker containers are completely locked down.
# Open a port for the Node.js server
EXPOSE 8877

# All Docker images need a default command to be executed automatically
# when running the container.
CMD ["babel-node", "src/server"]
