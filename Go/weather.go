package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"os"
)

type Openweathermap struct {
	Coord struct {
		Lon float64 `json:"lon"`
		Lat float64 `json:"lat"`
	} `json:"coord"`
	Weather []struct {
		ID          int    `json:"id"`
		Main        string `json:"main"`
		Description string `json:"description"`
		Icon        string `json:"icon"`
	} `json:"weather"`
	Base string `json:"base"`
	Main struct {
		Temp     float64 `json:"temp"`
		Pressure int     `json:"pressure"`
		Humidity int     `json:"humidity"`
		TempMin  float64 `json:"temp_min"`
		TempMax  float64 `json:"temp_max"`
	} `json:"main"`
	Visibility int `json:"visibility"`
	Wind       struct {
		Speed float64 `json:"speed"`
		Deg   int     `json:"deg"`
	} `json:"wind"`
	Clouds struct {
		All int `json:"all"`
	} `json:"clouds"`
	Dt  int `json:"dt"`
	Sys struct {
		Type    int     `json:"type"`
		ID      int     `json:"id"`
		Message float64 `json:"message"`
		Country string  `json:"country"`
		Sunrise int     `json:"sunrise"`
		Sunset  int     `json:"sunset"`
	} `json:"sys"`
	ID   int    `json:"id"`
	Name string `json:"name"`
	Cod  int    `json:"cod"`
}

func main() {
	// Get the API key from apikey.txt, located in the directory above the script
	apikey_file, _ := os.Open("../apikey.txt")
	bf := bufio.NewReader(apikey_file)
	APIKEY, _, _ := bf.ReadLine()

	// Process each command line argument as a location
	for i, location := range os.Args {
		if i == 0 {
			continue
		}

		// Make a request to http://api.openweathermap.org using the location as a query and imperial units
		url := fmt.Sprintf("http://api.openweathermap.org/data/2.5/weather?q=%s&units=imperial&appid=%s", url.QueryEscape(location), APIKEY)
		request, _ := http.NewRequest("GET", url, nil)
		client := &http.Client{}
		response, _ := client.Do(request)

		// Capture the JSON response
		var response_json Openweathermap
		json.NewDecoder(response.Body).Decode(&response_json)

		// From the response, print the name of the location, the current temperature, and the main weather,
		fmt.Printf("\"%s\", %f \"%s\"\n", response_json.Name, response_json.Main.Temp, response_json.Weather[0].Main)
	}
}
