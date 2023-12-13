#!/bin/bash

COUNT=$(checkupdates | wc -l)
if [ $COUNT != 0 ]; 
  then echo "   $COUNT"; 
fi

