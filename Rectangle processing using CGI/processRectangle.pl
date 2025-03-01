#!/usr/bin/perl
use CGI qw(:standard);

print header();
print start_html(-title=>"Rectangle Processing",
                            -head=>Link({-rel => 'stylesheet',
                            -type => 'text/css',
                            -href => 'styles.css'}));

$length = param("length");
$width = param("width");
$choice = param("choice");

print "<h1>Computing Rectangle Things</h1>\n";

$datestring = localtime();

open(FP, ">>rectangles.txt");

if ($choice eq "A")
{
    $area = $length *$width;
    printf ("<h2>The area of a %.1f rectangle is %.1f</h2>\n", $length, $width, $area);
    printf (FP "$datestring: The area of a %.1f by %.1f rectangle is %.1f \n", $length, $width, $area);
}

else
{
    $perimeter = 2*$length + 2*$width;
    printf(FP "$datestring: The perimeter of a %.1f by %.1f rectangle is %.1f \n",$length, $width ,$perimeter);
    printf("<h2>The perimeter of a %.1f rectangle is %.1f </h2>\n",$length, $width ,$perimeter);
}

print "<p>Go to <a href=\"index.html\">Kethan's page</a></p>\n";
print end_html();
