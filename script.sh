#!/bin/bash

docker build -t blazor_image .

docker run -dp 8080:80 --name blazor_container blazor_image
