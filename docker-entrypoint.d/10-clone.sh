#!/bin/bash

until ping -c1 www.google.com &>/dev/null; do sleep 2; done

until test -f /webapp/clone-done; do
  rm -rf /webapp/*
  (echo "Cloning ${GIT_REMOTE} to /webapp"; \
  git clone --progress --verbose ${GIT_REMOTE} /webapp; \
  cd /webapp; \
  echo "Setting revision to ${REVISION}"; \
  git reset --hard ${REVISION} \
  ) && touch /webapp/clone-done 
  sleep 3
done
