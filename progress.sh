#!/bin/bash

# Display a progress bar representing the current progress of some process
# which has completed `$1` steps out of `$2` total steps.
#
# Arguments:
# $1 = elapsed steps
# $2 = total steps (must be >= elapsed)
progress()
{
  local elapsed=${1}
  local total=${2}
  printf -v percent " %s%%" $(( (elapsed * 100) / total ))
  cols=$(tput cols 2>/dev/null || echo 80)
  width=$(( cols-${#percent} ))
  mid=$(( (width * elapsed) / total ))
  printf "\r"
  for (( i=0; i<mid ; i=i+1 )); do printf "▇"; done
  for (( i=mid ; i<width ; i=i+1 )); do printf "░"; done
  echo -n "$percent"
}
