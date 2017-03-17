package main

import (
    "fmt"
    "io/ioutil"
)
func main() {
    fmt.Println("Hello, World!")

    // Get the API key from apikey.txt, located in the directory above the script
    b, err := ioutil.ReadFile("../apikey.txt")
    fmt.Println(b) // print the content as 'bytes'
    str := string(b) // convert content to a 'string'
    fmt.Println(str) // print the content as a 'string'
    // Process each command line argument as a location
    // Make a request to http://api.openweathermap.org using the location as a query and imperial units
    // Capture the JSON response
    //response=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=${location}&units=imperial&appid=${APIKEY}")
    // From the response, print the name of the location, the current temperature, and the main weather,
}
