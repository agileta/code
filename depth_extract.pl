#!/usr/bin/perl

####This script takes in a VCF file
use strict;
#use warnings;

my %depths = ();
my @depth;

open IN, "chr18_test_set.vcf" or die;
open OUT, ">chr18depths.txt" or die;

while (<IN>){
  next if /^\#/;
  chomp;
  my @line = split("\t",$_);
  for(my $i=0; $i<=11; $i++){
    my @depth = split(":",$line[$i+9]);
    #push extracted depth to array with i as the key
    push (@{$depths{$i}}, $depth[2]);
  } 
}
for my $key (sort {$a<=>$b} keys %depths){
  print OUT ("Sample_$key,",join(",",@{$depths{$key}}),"\n");
}
close OUT;
close IN;