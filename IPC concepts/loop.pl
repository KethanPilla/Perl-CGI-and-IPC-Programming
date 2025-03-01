#!/usr/bin/perl

for ($i=1; $i<4; $i++)
{
  $x = fork();
  if ($x == 0)
   {
    # this is the child
     print("$$: hi\n");
     exit;
   }
  else
   {
    # this is the parent 
    print ("$$: bye\n");
   }
}


# OUTPUT
# 16551: bye
# 16551: bye
# 71175: hi
# 71357: hi
# 16551: bye
# 34753: hi