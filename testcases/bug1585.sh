#!/bin/sh
function just_print()
{
echo "All: $*"
echo "Dollar 1: $1"
echo "Dollar 2: $2"
echo "Dollar 3: $3"
}

echo "Calling just_print \"${1}\" \"${2}\" \"${3}\""
BLAB=`just_print "${1}" "${2}" "${3}"`
echo "$BLAB"
