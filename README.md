# h5ai

[h5ai](https://larsjung.de/h5ai/) is a modern web server index. This [docker](https://www.docker.com/) image makes it trivially easy to spin up a webserver and start sharing your files through the web.

![screenshot](./ss.png)

## Usage

This docker image is available as an [automated build on Docker Hub](https://hub.docker.com/r/darkabhi/docker-h5ai), so there's no setup required. Using this image for the first time will start a download automatically. Further runs will be immediate, as the image will be cached locally.

The recommended way to run this container looks like this:

```bash
$ docker run -it --rm -p 80:80 -v `pwd`:/var/www darkabhi/docker-h5ai
```

You can now point your webbrowser to this URL:

```
http://localhost/
```

This is a rather common setup following docker's conventions:

* `-it` will run an interactive session that can be terminated with CTRL+C
* `--rm` will run a temporary session that will make sure to remove the container on exit
* `-v {AnyDirectory}:/var/www` will mount the given directory as the base directory for the browsable directory index
* `-p {OutsidePort}:80` will bind the webserver to the given outside port
* `darkabhi/docker-h5ai` the name of this docker image
