#!/bin/bash
if [[ $# -eq 0 ]];
then
    exit 0
fi

# set options for time
timeopts=''

# get a temp file to hold the time data
tempfile="${0}_$(date +"%s").txt"

# call each solution and capture the output and time data
# bash
bash_output=$(/usr/bin/time $timeopts ../Bash/weather $1 2>$tempfile)
bash_time=$(<$tempfile)

# python
python_output=$(/usr/bin/time $timeopts ../Python/weather $1 2>$tempfile)
python_time=$(<$tempfile)

# perl
perl_output=$(/usr/bin/time $timeopts ../Perl/weather $1 2>$tempfile)
perl_time=$(<$tempfile)

# go
go_output=$(/usr/bin/time $timeopts ../Go/weather $1 2>$tempfile)
go_time=$(<$tempfile)

# clean up the temp file
rm -f $tempfile

# print the report
echo "Bash   : $bash_output $bash_time"
echo "Python : $python_output $python_time"
echo "Perl   : $perl_output $perl_time"
echo "Go     : $go_output $go_time"
