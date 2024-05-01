#!/bin/bash

REGEX_VOL=":(.*),"
[[ $(pw-volume status) =~ $REGEX_VOL ]]
echo ${BASH_REMATCH[1]}
