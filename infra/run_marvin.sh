#!/bin/bash
SLACK_TOKEN=$1
MARVIN_VERSION=$2
sudo docker run --rm -d -e HUBOT_SLACK_TOKEN=${SLACK_TOKEN} domingusj/marvin-hubot:${MARVIN_VERSION}
exit 0

