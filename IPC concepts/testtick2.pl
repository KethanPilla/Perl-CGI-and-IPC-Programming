#!/usr/bin/perl

@result = `ls -l`;

$size = @result;
print "The size of the list is $size\n"; 

print "0: $result[0]\n";
print "1: $result[1]\n";
print "2: $result[2]\n";
print "3: $result[3]\n";

# OUTPUT:

# The size of the list is 17
# 0: total 256

# 1: -rw-r--r--  1 kepill  student  250 Feb 22 20:21 args.pl

# 2: -rw-r--r--  1 kepill  student  347 Feb 18 08:27 f1.pl

# 3: -rw-r--r--  1 kepill  student   89 Feb 18 08:27 f2.pl