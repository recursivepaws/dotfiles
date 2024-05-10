#!/bin/bash
REGEX_VOL=": (.*)"
[[ $(wpctl get-volume @DEFAULT_AUDIO_SINK@) =~ $REGEX_VOL ]]
VOLUME=$(echo ${BASH_REMATCH[1]})
echo "$VOLUME * 100.0" | bc -l
