#!/bin/sh

s_update_registry()
{
   echo "ABDEFGHIJKLMNOPQRST"
   echo "1234567890"
   echo "XYZ"
   echo "FOORBARTHUDGRUNT"
}

s_update_registry "RTR" "0" | sed -e 's/"//g' -e 's/^/#/g'
