#!/usr/bin/perl

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
  $x = wait;
  print "PARENT: I just got word that $x died\n";
}
  
sub child
{
  sleep (5+rand(25));
  print "Child: $$  Hello I'm done\n";
  exit;
}

# OUTPUT

# Child: 2319  Hello I'm done
# PARENT: I just got word that 2319 died
# Child: 20667  Hello I'm done
# PARENT: I just got word that 20667 died
# Child: 92785  Hello I'm done
# PARENT: I just got word that 92785 died
# Child: 60731  Hello I'm done
# PARENT: I just got word that 60731 died
# Child: 59365  Hello I'm done
# PARENT: I just got word that 59365 died

# Explanation
# This function Waits for a child process to 
# terminate, returning the process ID of the 
# deceased process. The exit status of the 
# process is contained in $?.