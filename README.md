# The Open Weather Map CLI Challenge
Your challenge is to develop a command line interface to the [Open Weather Map API](http://openweathermap.org/api) in the programming language of your choice.

## Prequisites
1. [Sign up for a free Open Weather Map account](https://home.openweathermap.org/users/sign_up)
2. [Get an API key](https://home.openweathermap.org/api_keys)

## Tasks and Requirements
0. Fork the repository and create a directory named after your GitHub username under the language your solution is coded in.  For example, you'll find [managedkaos's](https://github.com/managedkaos?tab=repositories) Bash solution in `Bash/managedkaos`.

1. Start your code by getting an API key from a file named `apikey.txt`, located in the root of the repo.  The file should contain one line with just the key.  Do not commit the `apikey.txt` file to the repository.  The file is already in `.gitignore` but still, be careful. :pray:

2. Your code should process each command line argument as a location.  It can be a [ZIP code](https://en.wikipedia.org/wiki/ZIP_Code), a city name, or a string in "City,ST" format, where "ST" is an abbreviation for the name of state.  If no arguments are passed, exit silently without error.  For example, calling your script or program for the ZIP code 90245 would like like:

        ./weather 90245

3. Make a request to http://api.openweathermap.org using the location as a query and imperial units (so degrees are in Farenheit). The request will look like:

        http://api.openweathermap.org/data/2.5/weather?q=LOCATION&units=imperial&appid=APIKEY

4. Capture the JSON response.  The response will look like:

        {"coord":{"lon":-118.42,"lat":33.92},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"},{"id":721,"main":"Haze","description":"haze","icon":"50n"}],"base":"stations","main":{"temp":61.65,"pressure":1019,"humidity":100,"temp_min":55.4,"temp_max":71.6},"visibility":11265,"wind":{"speed":5.82,"deg":240},"clouds":{"all":75},"dt":1489557720,"sys":{"type":1,"id":413,"message":0.0116,"country":"US","sunrise":1489586595,"sunset":1489629717},"id":5345860,"name":"El Segundo","cod":200}


5. From the response, print the name of the location, the current temperature, and the main weather, all seperated by commas. The name of the location and the main weather should be enclosed in quotes.  Print the output for each location on a new line if the code receives multiple locations from the command line.  Using the examples above, the output would look like:

        "El Segundo", 61.65, "Mist"

6. That's it!  When your solution is complete, run tests to confirm your solution works.  Add a README file that explains how to build and run your solution.  Then, update the [README.md](README.md) at the root of the project with a link to your solution.  Submit a pull request and bask in the glory of your contribution! :star2:

# Solutions

## Bash
- [managedkaos](Bash/managedkaos)
- [vandot](Bash/vandot)

## Go
- [managedkaos](Go/managedkaos)

## Perl
- [managedkaos](Perl/managedkaos)

## Python
- [managedkaos](Python/managedkaos)
