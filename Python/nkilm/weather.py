from dotenv import load_dotenv
from os import environ
import requests
import sys

load_dotenv() # load secrets stored in .env file
API_KEY=environ.get('API_KEY')

def main(): 
    """ Check if API KEY is there or not """
    if(API_KEY is None):
        print("API KEY not found")
        sys.exit(1)

    """ Access location info from sys.args """
    location = None
    if(len(sys.argv) > 1):
        location = sys.argv[1]
    else:
        sys.exit(1)

    """ API call """
    URL = f"http://api.openweathermap.org/data/2.5/weather?q={location}&units=imperial&appid={API_KEY}"
    response = requests.get(URL)
    data = response.json()
    
    try:
        city = data["name"]
        temp = data["main"]["temp"]
        desc = data["weather"][0]["description"]
        print("%s, %.2f, %s"%(city,temp,desc))
    except: 
        if("message" in data.keys()):
            print(data["message"])
        else:
            print("Error: Please check the arguments given...")

if __name__ == "__main__":
    main()