#!/bin/sh

#set -xv

foo()
{
    return 0;
}


foo1()
{
    return 1;
}



if `foo`
then
    echo "!= EINS";
else
    echo "EINS";
fi

if `foo1`
then
    echo "!= EINS";
else
    echo "EINS";
fi

set +xv
