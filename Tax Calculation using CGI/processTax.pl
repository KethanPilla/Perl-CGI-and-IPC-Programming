#!/usr/bin/perl
use CGI qw(:standard);

print header();
print start_html(-title=>"Tax Processing",
                        -head=>Link({-rel => 'stylesheet',
                        -type => 'text/css',
                        -href => 'style.css'}));

$tax_withheld = param("tax_withheld");
$annual_wages = param("annual_wages");
$choice = param("choice");

print "<h1>Calculating Tax refunds</h1>\n";

$datestring = localtime();

open(FP, ">>refunds.txt");

# Handle choice
if ($choice eq "S") {
    $deduction = 1500;
    print ("<h2>The deductions are set to $deduction</h2>\n");
    print "<p>We are assuming you are single/head of household/married but filing separately.</p>\n";
} elsif ($choice eq "M") {
    $deduction = 3000;
    print ("<h2>The deductions are set to $deduction</h2>\n");
    print "<p>We are assuming you are married filing a joint return.</p>\n";
} else {
    print "<h2>Invalid selection. Please try again.</h2>\n";
    exit;
}

# Calculate taxable income
$taxable_income = $annual_wages - $deduction;
$calTax = 0;

if ($taxable_income > 0) {
    # Calculate tax based on brackets
    if ($choice eq "S") {
        if ($taxable_income <= 500) {
            $calTax = 0.02 * $taxable_income;
        } elsif ($taxable_income <= 3000) {
            $calTax = (0.02 * 500) + (0.04 * ($taxable_income - 500));
        } else {
            $calTax = (0.02 * 500) + (0.04 * 2500) + (0.05 * ($taxable_income - 3000));
        }
    } elsif ($choice eq "M") {
        if ($taxable_income <= 1000) {
            $calTax = 0.02 * $taxable_income;
        } elsif ($taxable_income <= 6000) {
            $calTax = (0.02 * 1000) + (0.04 * ($taxable_income - 1000));
        } else {
            $calTax = (0.02 * 1000) + (0.04 * 5000) + (0.05 * ($taxable_income - 6000));
        }
    }

    # Calculate refund
    $refund = $tax_withheld - $calTax;
    printf(FP "$datestring: Your tax refund is \$%.0f </h2>\n", $refund);
    printf("<h2>Your tax refund is \$%.0f </h2>\n", $refund);
} else {
    print "<h2>No taxable income. No refund available.</h2>\n";
    printf(FP "No taxable income. No refund available.\n");
}        
        
print "<p>Go to <a href=\"index.html\">Biography page</a></p>\n";
print end_html();
