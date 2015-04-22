#!/usr/bin/perl

####This script takes in a VCF file
use strict;
#use warnings;

opendir my $dir, "/group/palmer-lab/Rats/SD/GBS/vars_" or die "Cannot open directory: $!";
@files = grep(/vcf$/,readdir($dir));
print join(" ",@files);
closedir $dir;

open OUT, ">depths.txt" or die;
my %depths = ();

foreach(@files){
  my @depth;

  open IN, "$_" or die;

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
}