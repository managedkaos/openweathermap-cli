#!/usr/bin/env bash

# set -euo pipefail
# IFS=$'\n\t'

#/
#/ Usage: 
#/ ./weather.sh [option]
#/ 
#/ Description:
#/ CLI "tool" and a bash "library" for getting and parsing weather data based on users geolocation data
#/ 
#/ You need OpenWeatherMap API key, set it as a WEATHER_APPID env variable
#/ or provide it with -i, --appid argument
#/
#/ Examples:
#/ ./weather.sh
#/ ./weather.sh -l "New York"
#/ You can source this file and use it's functions
#/ get_weather
#/
#/ Options:

usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*-h" > /dev/null && usage
expr "$*" : ".*--help" > /dev/null && usage

declare -x APPID="${WEATHER_APPID}"
declare -x UNITS="metric"
declare -x WEATHER_SERVER="http://api.openweathermap.org/data/2.5/weather"
declare -x GEOIP_SERVER="https://freegeoip.app/csv/"

# Check if jq or python for parsing JSON
json_parse() {
  resp=$(</dev/stdin)
  if command -v jq >/dev/null 2>&1; then
    echo "${resp}" | jq -re '[.name,.main.temp,.weather[0].main] | "\(.[0]) \(.[1]) \(.[2])"'
  else
    echo JSON parser not found, install jq
    exit 1
  fi
}

get_location() {
  read -r country city < <(curl -s "${GEOIP_SERVER}" | cut -f6,2 -d',' | tr ',' ' ')
  LOCATION="${city},${country}"
}

get_weather() {
  if [[ -z $APPID ]]; then
    echo WEATHER_APPID not set, use --appid argument or ENV variable
    exit 1
  fi
  if [[ -z $LOCATION ]]; then
    get_location
  fi
  URLPATH="?q=${LOCATION}&units=${UNITS}&appid=${APPID}"
  curl -s -H "Accept: application/json" "${WEATHER_SERVER}${URLPATH}" | json_parse
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then

  # Fantastic solution from Bruno Bronosky - http://stackoverflow.com/a/14203146
  while [[ $# -gt 1 ]]; do
    key="$1"

    case "${key}" in
#/   -u, --units metric|imperial [metric]  
        -u|--units)
          UNITS="${2}"
          shift
        ;;
#/   -l, --location city_name|city_name,country_code
        -l|--location)
          LOCATION="${2}"
          shift
        ;;
#/   -i, --appid OpenWeatherMap API key, can read WEATHER_APPID env variable
        -i|--appid)
          APPID="${2}"
          shift
        ;;
#/   -h, --help: Display this help message     
        *)
          usage
        ;;
    esac
    shift
  done
  get_weather
fi
