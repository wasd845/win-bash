#!/bin/sh

is_OS_NT()
{
   return 0;
}

s_update_registry()
{
   if `is_OS_NT`
   then
         :
   else
      return 0
   fi
   echo "BAR"
   echo "FOO"
}

is_OS_NT2()
{
   return 1;
}

s_update_registry2()
{
   if `is_OS_NT2`
   then
         :
   else
      return 0
   fi
   echo "BAR"
   echo "FOO"
}


s_update_registry "RTR" "0" | wc -l
s_update_registry2 "RTR" "0" | wc -l


