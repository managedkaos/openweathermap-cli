#!/bin/bash
if [[ $# -eq 0 ]];
then
    exit 0
fi
echo "Bash   : $(../Bash/weather $1)"
echo "Python : $(../Python/weather $1)"
echo "Perl   : TBD"
echo "Go     : TBD"
