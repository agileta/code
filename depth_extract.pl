#!/usr/bin/perl

####This script takes in a VCF file
use strict;
#use warnings;
print "At LEAST IT FUCKING STARTED";
$| = 1;
opendir my $dir, "/group/palmer-lab/Rats/SD/GBS/vars_" or die "Cannot open directory: $!";
print "I DID IT!";
my @files = grep(/vcf$/,readdir($dir));
print join(" ",@files);
closedir $dir;

open OUT, ">depths.txt" or die;
my %depths = ();
my $key;

foreach(@files){
  my @depth;

  open IN, "/group/palmer-lab/Rats/SD/GBS/vars_/$_" or die;

  while (<IN>){
    next if /^\#/;
    chomp;
    my @line = split("\t",$_);
    for(my $i=0; $i<=95; $i++){
      my @depth = split(":",$line[$i+9]);
      #push extracted depth to array with i as the key
      push (@{$depths{$i}}, $depth[2]);
    } 
  }
  close IN;
  print "Made it out of the reading";	
  for my $key (sort {$a<=>$b} keys %depths){
    print OUT ("Sample-$key-$_,",join(",",@{$depths{$key}}),"\n");
  }
  print "$_ finished printing";
}
close OUT;
