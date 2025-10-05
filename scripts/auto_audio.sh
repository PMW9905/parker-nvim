#!/bin/bash
until hyprctl monitors all | grep -E "HDMI|DP"; do 
  echo "1"
  sleep .5
done
until wpctl status | grep "HDMI"; do 
  echo "2"
  sleep .5
done
until wpctl status | grep "Headphones"; do 
  echo "3"
  sleep .5
done



TV_LINE=$(wpctl status | grep HDMI)
HEADPHONE_LINE=$(wpctl status | grep Headphones)

if hyprctl monitors all | grep "HDMI"; then 
  [[ $TV_LINE =~ ([0-9]+)\. ]]
  tv_id="${BASH_REMATCH[1]}"
  wpctl set-default $tv_id
  echo "tv found. defaulting to tv audio"
else 
  [[ $HEADPHONE_LINE =~ ([0-9]+)\. ]]
  headphone_id="${BASH_REMATCH[1]}"
  wpctl set-default $headphone_id
  echo "tv not found. defaulting to focusrite headphones"
fi
