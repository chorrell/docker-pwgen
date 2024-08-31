# docker-pwgen

[![Docker](https://github.com/chorrell/docker-pwgen/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/chorrell/docker-pwgen/actions/workflows/docker-publish.yml)

A docker image for pwgen

## Usage with Docker run

Use this Docker image from the command line in the same way you would with pwgen.

First build the image:

```sh
docker build -t pwgen .
```

Now use the image to call pwgen with `docker run -i --rm pwgen`:

Run pwgen without arguments:

```sh
docker run -i --rm pwgen
```

Usage:

```sh
docker run -i --rm pwgen -h
```

Generate some long, complex passwords:

```sh
docker run -i --rm pwgen -sync 25
```

## Make it easier with an alias

Add this to your `.bashrc` or `.zshrc` file:

```bash
alias pwgen='docker run -i --rm pwgen'
```

## Using the Docker Hub image

The lateset version of this image is published to the Docker Hub. You can use it like this:

```sh
docker pull chorrell/pwgen:latest

docker run -i --rm chorrell/pwgen:latest
```

And setup an alias like this:

```bash
alias pwgen='docker run -i --rm chorrell/pwgen:latest'
```

## Using the GitHub Container Registry image

The lateset version of this image is published to the GitHub Container Registry. You can use it like this:

```sh
docker pull ghcr.io/chorrell/pwgen:latest

docker run -i --rm ghcr.io/chorrell/pwgen:latest
```

And setup an alias like this:

```bash
alias pwgen='docker run -i --rm ghcr.io/chorrell/pwgen:latest'
```
