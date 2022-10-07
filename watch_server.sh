#!/bin/sh -e

npm run server:dev &
serverPid=$!

chokidar 'src/**/*.elm' 'src/**/*.html' -c 'npm run build:dev'

kill $serverPid
