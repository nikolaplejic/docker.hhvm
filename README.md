# docker.hhvm

...a really simple Docker container for playing around with Facebook's HHVM / Hack. Based on the excellent Docker-noobie friendly [phusion/baseimage](https://github.com/phusion/baseimage-docker).

The container doesn't have a database server configured. It should be fairly easy to add one, or spin up a new container dedicated to running a data store.

**Note:** Do not use this for anything resembling a production environment.

## Usage

First, verify it works:

    # docker build -t hhvm .
    # docker run -t -p 80 hhvm

This will expose port 80 within the container, you should run `docker ps` to check the port equivalent on the host machine and go to http://localhost:{EXPOSED_PORT} to confirm you get the proverbial "Hello, world!" message.

nginx is pointed to `/mnt/hhvm` which is by default set up to serve the example index.hh file located within the repository. However, a much more interesting use case is mounting a host directory as a container volume, allowing you to run files from the host machine through the HHVM FastCGI instance within the container:

    # docker run -t -p 80 -v /path/to/the/host/machine/directory:/mnt/hhvm:ro hhvm

Now simply put your .hh (or .php) files to /path/to/the/host/machine/directory on the host machine and enjoy Hacking. :)
