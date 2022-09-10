#!/bin/bash

exec docker run --rm -i -v "$PWD:/mnt:ro" koalaman/shellcheck:stable "$@"
