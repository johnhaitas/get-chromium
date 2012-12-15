#!/bin/bash

set -e

ROOT_URL="http://commondatastorage.googleapis.com/chromium-browser-snapshots"

case `uname` in
	'Darwin' )
		OS_URL="${ROOT_URL}/Mac"
		FILE_NAME="chrome-mac.zip"
		LAST_CHANGE=$(curl ${OS_URL}/LAST_CHANGE)
		curl -O ${OS_URL}/${LAST_CHANGE}/${FILE_NAME}

		unzip -q ${FILE_NAME}
		mkdir -p ${HOME}/Applications
		mv chrome-mac/Chromium.app ${HOME}/Applications/Chromium.app
		rm -rf ${FILE_NAME} chrome-mac
		;;

	'Linux' )
		OS_URL="${ROOT_URL}/Linux"
		FILE_NAME="chrome-linux.zip"
		LAST_CHANGE=$(curl ${OS_URL}/LAST_CHANGE)
		curl -O ${OS_URL}/${LAST_CHANGE}/${FILE_NAME}

		unzip -q ${FILE_NAME}
		rm -rf ${FILE_NAME}
		;;
esac

