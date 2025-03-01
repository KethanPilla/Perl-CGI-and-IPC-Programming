#!/usr/bin/perl


$result = `finger`;

print "The result is:\n$result";


# OUTPUT
# The result is:
# Login    Name                 Tty  Idle  Login Time   Office     Office Phone
# anansh   Anshika Anshika       p8     -     Wed 18:36
# anclar   Andrew Clark          p3     -     Wed 19:05
# jaferr   Jackson Ferrigno      p6  5:11     Wed 11:52
# kepill   Kethan Pilla          p1     -     Wed 19:24
# lashel   Landan Shelton        p4     -     Wed 19:24
# nasing   Navraj Singh          p2    20     Wed 15:37
# zoelli   Zoe Ellis             p0  4:05     Wed 15:04


# Explanation
# Net::Finger is a Perl module that implements a finger client. 
# It's a simple way to get information about a remote user. 