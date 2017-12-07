#!/bin/sh
set -e

LABELS="${LABELS:-docker}"
EXECUTORS="${EXECUTORS:-3}"
FSROOT="${FSROOT:-/tmp/jenkins}"

mkdir -p $FSROOT
java -jar swarm-client.jar $(cat /run/secrets/jenkins)  -labels=$LABELS -executors=$EXECUTORS -fsroot=/tmp/jenkins -name=docker-$(hostname)
