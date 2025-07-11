#!/usr/bin/python3

import requests
import json
URL = "https://api.github.com/users/1xtier/keys"
#json_data = requests.get('https://api.github.com/users/1xtier/keys').json()
response = requests.get(URL)
if response.status_code == 200:
    json_data = response.json()
    for item in json_data:
        with open("/root/.ssh/key", "w+") as myfile:
          print(item['key'], file=myfile)

else:
    print("error")
