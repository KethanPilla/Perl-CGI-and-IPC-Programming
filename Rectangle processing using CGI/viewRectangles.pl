use CGI qw(:standard);

print header();
print start_html(-title=>"Rectangle View",
                            -head=>Link({-rel => 'stylesheet',
                            -type => 'text/css',
                            -href => 'styles.css'}));

print "<h1>Viewing the Rectangle Things</h1>\n";

open (FP, ">>rectangles.txt");
@data=<FP>;
close(FP);

print "<p>";
foreach $rectangle (@data)
{
    print "$rectangle<br />";
}
print "</p>";

print "<p>Go to <a href=\"index.html\">Kethan's page</a></p>\n";

print end_html();
