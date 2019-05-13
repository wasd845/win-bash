#!/bin/sh

echo "in parent"
value=` ./scriptcall_child.sh`
echo "called in quotes:"
echo "$value"

exit 0
