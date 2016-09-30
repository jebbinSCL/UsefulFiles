#!/bin/bash -euv
cd $1
until bash $2; do
    echo "Server $1 crashed with exit code $?.  Respawning.." >&2
    sleep 1
done