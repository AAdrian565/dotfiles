#!/bin/bash

if [ "$(eww get show_ip)" == "true" ]; then
    eww update show_ip=false
else
    eww update show_ip=true
fi
