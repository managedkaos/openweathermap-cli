# Open Weather Map CLI
A command line interface to the Open Weather Map API.

Implement solutions in Bash, Python, and Go.

 Requirements are:

1. Get the API key from apikey.txt, located in the directory above the script.  The file contains one line with the just the key.

2. Process each command line argument as a location.  It can be a ZIP code, City, or "City,ST" format.  If no arguments are passed, exit silently without error.  The command should like like:

            `./weather 90245`

3. Make a request to http://api.openweathermap.org using the location as a query and imperial units (so degrees are in Farenheit). The request will look like:

            `http://api.openweathermap.org/data/2.5/weather?q=${location}&units=imperial&appid=${APIKEY}`

4.  Capture the JSON response.  The response will look like:

            `response='{"coord":{"lon":-118.41,"lat":33.88},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"},{"id":741,"main":"Fog","description":"fog","icon":"50n"}],"base":"stations","main":{"temp":63.07,"pressure":1018,"humidity":100,"temp_min":55.4,"temp_max":73.4},"visibility":9656,"wind":{"speed":8.05,"deg":240},"clouds":{"all":40},"dt":1489553880,"sys":{"type":1,"id":413,"message":0.0081,"country":"US","sunrise":1489586596,"sunset":1489629713},"id":5370082,"name":"Manhattan Beach","cod":200}'`

5.  From the response, print the name of the location, the current temperature, and the main weather, seperated by commas.  The output will look like:

            `"El Segundo", 61.57, "Mist"`
