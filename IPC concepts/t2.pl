#!/usr/bin/perl

print "Enter string to search for: ";
$str = <STDIN>;
chomp($str);
system("grep $str *");

# OUTPUT
# Enter string to search for: pipe
# pipe.pl:pipe (INPUT, OUTPUT);
# pipe2.pl:pipe (INPUT, OUTPUT);
# pipe3.pl:pipe (INPUT, OUTPUT);
# pipe4.pl:pipe (INPUT, OUTPUT);
# pipe5.pl:pipe(I1,O1);
# pipe5.pl:pipe(I2,O2);

# The command system("grep $str *"); uses the grep command to search for a string in all files in the current directory. 
# Explanation
# grep: A command-line utility that searches for lines that match a regular expression in a file 
# $str: The string to search for 
# \*: An asterisk that indicates searching all files in the current directory 