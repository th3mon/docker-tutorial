# Docker Tutorial

This is a React front-end and Node back-end sample application, meant to be set up using Docker.

## BUILDING THE IMAGE
Before you can use it in a container, you have to build your image. Type the following (making sure to include the . at the end)

```bash
docker build -t node-tutorial .
```

Here, the -t parameter gives a name to the image; so, we can refer to it later without having to use the generated UUID hash.

# RUN THE CONTAINER

```bash
docker run -p 8877:8877 -p 3001:3001 --name node-tut -v $(pwd)/src:/usr/local/src/src --sig-proxy=false node-tutorial npm run browsersync
```

The basic anatomy looks like this:

```bash
docker run [OPTIONS] IMAGE [COMMAND] [ARG…]
```

These were our OPTIONS

* -p hostPort:containerPort
This maps the container ports to the host so that you can expose and access the web server ports.
* -v hostDir:containerDir
This mounts the local files and folders so that your local edits get pushed to the container without requiring a rebuild.
* --name containerName
This assigns a name to your container so that you don’t have to use the UUID hash.
* --sig-proxy=false
This lets us exit from Docker’s shell without killing the running process inside (by not proxying the SIGTERM — hence, the name).

Finally, the name of the IMAGE is node-tutorial, and the COMMAND + ARG… are npm + run browsersync.
