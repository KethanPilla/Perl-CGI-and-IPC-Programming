use CGI qw(:standard);

print header();
print start_html(
    -title => "View Tax Refunds",
    -head  => Link({
        -rel  => 'stylesheet',
        -type => 'text/css',
        -href => 'style.css'
    })
);

print "<h1>Viewing Previous Tax Refunds</h1>\n";

# Open the refunds file for reading
if (open(FP, ">>refunds.txt")) {
    @data = <FP>;
    close(FP);

    # Display refunds if file is not empty
    if (@data) {
        print "<p>";
        foreach $refund_entry (@data) {
            print "$refund_entry<br />\n";
        }
        print "</p>";
    } else {
        print "<p>No tax refunds have been recorded yet.</p>\n";
    }
} else {
    print "<p>Error: Unable to open the refunds file. Please check file permissions.</p>\n";
}

print "<p>Go to <a href=\"index.html\">Biography page</a></p>\n";

print end_html();

