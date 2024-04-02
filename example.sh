#!/bin/bash

set -eu
source ./progress.sh

SLEEP_DURATION=${SLEEP_DURATION:=1}
steps=10
for (( elapsed=1; elapsed<=steps; elapsed=elapsed+1 )); do
  progress $elapsed $steps
  sleep "$SLEEP_DURATION"
done
printf "\r\033[K" # Deletes the progress bar.
