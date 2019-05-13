#!/bin/sh

is_tivoli()
{
      return 1
}

S_TASK_EXISTS=`ls   |wc -l `

`is_tivoli 1`; echo $?
`is_tivoli 2`; echo $?


