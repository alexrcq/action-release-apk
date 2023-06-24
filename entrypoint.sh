#!/bin/bash

git config --global --add safe.directory /github/workspace
hub checkout ${REPO_BRANCH:-master}
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./${APP_FOLDER}/build.gradle`
hub release create -a ./${APP_FOLDER}/build/outputs/apk/release/*.apk -m "${VERSION_NAME}" $(date +%Y%m%d%H%M%S)
