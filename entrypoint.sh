#!/usr/bin/env bash

set -xe

PORT="${PORT:-80}"

case "$1" in
  run-prod)
    exec gunicorn \
      herokudocker.wsgi \
      -b 0.0.0.0:$PORT \
      --max-requests 1000 \
      --max-requests-jitter 100 \
      -t 240 \
      --log-file -
    ;;

  *)
    echo "Executing: $@"
    exec "$@"
    ;;
esac


