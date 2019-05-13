#!/bin/sh

if [ "X" != "X$XPATHBUGWORKAROUND" ]
then
   PATH="$XPATHBUGWORKAROUND"
   export PATH
fi


echo " "
echo "====================="
echo " Starting testcases"
echo "====================="
echo " "
echo "PATH: $PATH"
echo "PATHEXT: $PATHEXT"
echo "Bash location: $BASH"
echo "Bash version: $BASH_VERSION"
DATE=`date`;
echo "Date: $DATE "
echo " "


if [ -d tmp ]
then
    rm -rf tmp
fi

mkdir tmp

cnt=0;
err_cnt=0;
ok_cnt=0;

testcases=`ls test_*.sh`
#echo " "
#echo "$testcases"
#echo " "
#testcases=`test_*.sh`

for testcase in $testcases
do
    tc_name=`basename $testcase`
    echo -n "Running testcase "
    tc_display=`echo $tc_name | awk '{printf "%-20s",$1; }'`;
    echo -n	"$tc_display ... ";
    err=0;

    sh $testcase >tmp/$tc_name.out 2>tmp/$tc_name.err

    diff $tc_name.out tmp/$tc_name.out > tmp/$tc_name.out.diff  2>&1
    rcout=$?
    if [ 0 -eq $rcout ]
    then
       echo -n "STDOUT OK  ... "
    else
       echo -n "STDOUT NOK ... "
       err=1;
    fi

    if [ -f $tc_name.err ]
    then
        diff $tc_name.err tmp/$tc_name.err > tmp/$tc_name.err.diff  2>&1
        rcerr=$?
        if [ 0 -eq $rcout ]
        then
           echo -n "STDERR OK  ... "
        else
           echo -n "STDERR NOK ... "
           err=1;
        fi
    else
       # stderr output should not exist => check if the err file is empty
       errlen=`cat tmp/$tc_name.err |wc -c`
       errlen=`eval echo $errlen`
       if [ 0 -eq $errlen ]
       then
           echo -n "STDERR OK ... "
        else
           echo -n "STDERR NOK ... "
           err=1;
        fi
    fi

    cnt=`expr $cnt + 1`;
    cnt=`eval echo $cnt`;

    if [ 0 -eq $err ]
    then
        echo "    PASSED    "
        ok_cnt=`expr $ok_cnt + 1`;
        ok_cnt=`eval echo $ok_cnt`;
    else
        echo "*** FAILED ***"
        err_cnt=`expr $err_cnt + 1`;
        err_cnt=`eval echo $err_cnt`;

    fi

done

echo " "
echo "$cnt testcases done, $ok_cnt passed, $err_cnt failed"
echo " "

if [ 0 -eq $err_cnt ]
then
   # errors occured
   exit 1;
fi

# no errors occured
exit 0
