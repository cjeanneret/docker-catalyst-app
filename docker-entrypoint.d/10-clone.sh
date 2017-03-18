#!/bin/bash

echo "Cloning ${GIT_REMOTE} to /webapp"
git clone ${GIT_REMOTE} /webapp
cd /webapp
echo "Setting revision to ${REVISION}"
git reset --hard ${REVISION}

touch /webapp/clone-done
