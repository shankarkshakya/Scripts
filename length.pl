#!/usr/bin/perl

######### Given a multifasta file, returns the length of each sequence#############

use strict;
use warnings;

open my $fasta_file, '<', $ARGV[0] or die $!;
my ($id, $seq);
while (<$fasta_file>) {
    chomp;
    if (/^>(\S+).*/) {
        print "$id\t", length($seq), "\n" if defined $id;
        $id = $1;
        $seq = '';
    } else {
        $seq .= $_;
    }
}
close $fasta_file;
print "$id\t", length($seq), "\n";
