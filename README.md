# Open Weather Map CLI
A command line interface to the Open Weather Map API.

Implement solutions in Bash, Python, and Go.

 Requirements are:

1. Get the API key from apikey.txt, located in the directory above the script.  The file contains one line with the just the key.

2. Process each command line argument as a location.  It can be a ZIP code, City, or "City,ST" format.  If no arguments are passed, exit silently without error.  The command should like like:

        ./weather 90245

3. Make a request to http://api.openweathermap.org using the location as a query and imperial units (so degrees are in Farenheit). The request will look like:

        http://api.openweathermap.org/data/2.5/weather?q=LOCATION&units=imperial&appid=APIKEY

4.  Capture the JSON response.  The response will look like:

        {"coord":{"lon":-118.42,"lat":33.92},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"},{"id":721,"main":"Haze","description":"haze","icon":"50n"}],"base":"stations","main":{"temp":61.65,"pressure":1019,"humidity":100,"temp_min":55.4,"temp_max":71.6},"visibility":11265,"wind":{"speed":5.82,"deg":240},"clouds":{"all":75},"dt":1489557720,"sys":{"type":1,"id":413,"message":0.0116,"country":"US","sunrise":1489586595,"sunset":1489629717},"id":5345860,"name":"El Segundo","cod":200}


5.  From the response, print the name of the location, the current temperature, and the main weather, seperated by commas.  The output will look like:

        "El Segundo", 61.65, "Mist"
