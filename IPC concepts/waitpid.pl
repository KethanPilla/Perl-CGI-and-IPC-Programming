#!/usr/bin/perl

print "PARENT: My process ID is $$\n";

foreach $i (0..4)
{
  $ids[$i]=fork();
  if ($ids[$i]==0)
    {
      # This is the child process
      &child;
    }
}

# This is the parent process

foreach $i (0..4)
{
  $x = waitpid $ids[$i], $FLAGS;
  print "PARENT: I just got word that $x died\n";
}
  

# This subroutine is the code that all the children will execute.
# It simply prints out a hello message and sleeps for a random
# number of seconds between 5 and 30 seconds, then exits.
sub child
{
  sleep (5+rand(25));
  print "Child: $$  Hello I'm done\n";
  exit;
}

# OUTPUT:
# PARENT: My process ID is 11543
# Child: 60315  Hello I'm done
# Child: 92487  Hello I'm done
# Child: 12863  Hello I'm done
# Child: 86036  Hello I'm done
# PARENT: I just got word that 86036 died
# PARENT: I just got word that 92487 died
# Child: 93922  Hello I'm done
# PARENT: I just got word that 93922 died
# PARENT: I just got word that 60315 died
# PARENT: I just got word that 12863 died

# Explanation

# This function waits for the child process with 
# ID PID to terminate, returning the process ID 
# of the deceased process. If PID does not exist, 
# then it returns -1. The exit status of the 
# process is contained in $?.

# In Perl, "wait" simply waits for any child process 
# to terminate and returns its PID, while "waitpid" 
# allows you to specifically wait for a particular 
# child process identified by its PID