# Godot Engine Docker Image

[![Docker Build](https://img.shields.io/docker/build/shelbyd/godot.svg)](https://hub.docker.com/r/shelbyd/godot/builds/)
![Docker Pull](https://img.shields.io/docker/pulls/shelbyd/godot.svg)

Official Linux server builds of Godot Engine + the official templates

Godot Engine is located at `/usr/local/bin/godot` and the templates are installed in `/.local/share/godot/templates/${GODOT_VERSION}.stable`.

### Usage Example (Travis CI)

```yaml
services:
  - docker
install:
  - docker pull shelbyd/godot
script:
  - docker run -v $(pwd):/build/src -v $(pwd)/output:/build/output shelbyd/godot /bin/bash -c "godot --export-debug 'Mac OSX' /build/output/foo-mac.zip --path /build/src --quit -v"
deploy:
  - provider: releases
    skip-cleanup: true
    api_key: $GITHUB_TOKEN
    file_glob: true
    file: output/*
    on:
      branch: master
```
