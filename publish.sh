#!/bin/bash
set -Eeuo pipefail

DOCKER_REPO=$1
DOCKER_TAG=$2

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push $DOCKER_REPO:$DOCKER_TAG \
    && curl -X POST -H 'Content-type: application/json' --data '{"text":"published: '$DOCKER_REPO:$DOCKER_TAG'"}' $SLACK_NOTICE_URL
docker push $DOCKER_REPO:mce-cn-$DOCKER_TAG \
    && curl -X POST -H 'Content-type: application/json' --data '{"text":"published: '$DOCKER_REPO:mce-cn-$DOCKER_TAG'"}' $SLACK_NOTICE_URL
docker push $DOCKER_REPO:mce-com-$DOCKER_TAG \
    && curl -X POST -H 'Content-type: application/json' --data '{"text":"published: '$DOCKER_REPO:mce-com-$DOCKER_TAG'"}' $SLACK_NOTICE_URL
