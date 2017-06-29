#!/usr/bin/env perl

use strict;
use warnings;
use Cwd;
use File::Find;

my $nruns=$ARGV[0];
print "Simulating $nruns events\n";

for(my $count = 0; $count <= $nruns; $count++) {
  
    my $command = "../Linux-x86_64/LhaaSim.exe /projet/auger/Diane/Corsika/DAT050300.root";
    system($command);    
    $command = "mv Sim_DAT050300.root Sim_" . $count. ".root";
    system($command);
}

my $command2 = "hadd SimTot.root Sim_*.root";
system($command2);   