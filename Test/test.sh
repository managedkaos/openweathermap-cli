#!/bin/bash
if [[ $# -eq 0 ]];
then
    exit 0
fi
echo $(../Bash/weather $1)
echo $(../Python/weather $1)
