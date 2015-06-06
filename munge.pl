# -*- mode: perl -*-

use strict;
use Encode;
use IO::File;

die "malo parametru" unless $ARGV[0];

my ($base_name) = $ARGV[0] =~ /(.*)\.[^.]+$/;
print "$base_name\n";
die '$base_name is empty' unless $base_name;

my ($file, $out_file);
open ($file, "<:encoding(cp1250)", $ARGV[0]) or die "$!";
open ($out_file, ">:utf8", $base_name."-utf8.csv") or die "$!";

while (my $line = <$file>)
{
    chomp $line;
    next unless $line;
    my ($name, $count) = (split ';', $line)[1..2];
    next unless $name;
    next unless $count;
    print $out_file "$name;$count\n";
}
