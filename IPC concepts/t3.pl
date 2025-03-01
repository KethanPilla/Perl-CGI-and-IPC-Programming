#!/usr/bin/perl

print "This is before the exec command\n";
exec('ls');
print "Experts say this line will never execute\n";


# OUTPUT

# This is before the exec command
# args.pl       loop.pl       pipe3.pl      t1.pl         testtick.pl   waitpid.pl
# f1.pl         pipe.pl       pipe4.pl      t2.pl         testtick2.pl
# f2.pl         pipe2.pl      pipe5.pl      t3.pl         wait.pl

# Explanation
# In Perl, system('ls'); will execute the "ls" command and return control 
# to your script after the command finishes, allowing you to capture its 
# output, while exec('ls'); will directly replace your current script 
# with the "ls" command, meaning your script will terminate and the 
# output of "ls" will be printed directly to the console without 
# further control from your script