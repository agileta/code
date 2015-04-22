#!/usr/bin/perl

use strict;
use warnings;

my %depths = ();
my $depth;


#open IN, "chr18_test_set.vcf" or die;
#open OUT, ">chr18depths.txt" or die;
#while (<IN>){
  #chomp;
  my $test = "col1\tcol2\tcol3\tcol4\tcol5\tcol6\tcol7\tcol8\tcol9\t1:2:3:4:5\t6:7:8:9:10\t11:12:13:14:15";
  my @line = split("\t",$test);
  for(my $i=0; $i<=2; $i++){
    my @depth = split(":",$line[$i+9]);
    #push extracted depth to array with i as the key
    push (@{$depths{i}}, $depth[3]);
    } 
  for (keys %depths){
    print "$depth{$_}\n";
  }