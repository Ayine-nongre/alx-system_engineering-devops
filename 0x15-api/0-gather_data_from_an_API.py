#!/usr/bin/python3
"""
This is script fetchs data from an api
"""


import json
import requests
from sys import argv


if __name__ == '__main__':
    details = requests.get('https://jsonplaceholder.typicode.com/users/' + argv[1])
    data = requests.get('https://jsonplaceholder.typicode.com/users/'+ argv[1] +'/todos/')
    data = data.json()
    name = details.json()['name']
    completed = 0

    for tasks in data:
        if tasks.get('completed') is True:
            completed = completed + 1

    print("Employee {} is done with tasks({}/{}):".format(name, completed, len(data)))
    for tasks in data:
        if tasks.get('completed') is True:
            print("\t" + tasks.get("title"))
