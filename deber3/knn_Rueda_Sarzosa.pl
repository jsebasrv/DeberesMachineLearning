use strict;
use warnings;
use Data::Dump qw(dump);
#use 5.010; 
use IO::Handle;
use File::Temp "tempfile";

#KNN
my @data=(
        [5,2,0],
        [2,4,0],
        [2,5,1],
        [4,6,1],
        [5,2,1],
        [1,5,1],
        [6,7,0],
        [4,2,0],
        [6,4,0],
        [9,2,0],
        [4,5,1],
        [1,6,1],
        [4,7,0],
        [3,6,0],
        [1,1,0],
        [8,4,1],
        [8,7,1],
        [7,2,1],
        [2,2,0],
        [2,1,0],
        [1,2,0],
        [1,4,1],
        [2,6,1],
        [7,7,0],
        [7,4,0],
        [3,4,1],
        [1,4,1]
        );

for (my $i=0; $i<@data; $i++){
    my (@x, @y, @label)=();
    $x[$i]=$data[$i][0];
    $y[$i]=$data[$i][1];
    $label[$i]=$data[$i][2];
    #print "(",$x[$i],", ",$y[$i],", ",$label[$i],")\n";
}


my($T,$N) = tempfile("plot-XXXXXXXX", "UNLINK", 1);

for my $t (100..500) #traza las lineas, y el tamanio es automatico
        { say $T $t*sin($t*0.1), " ", $t*cos($t*0.1); } 
close $T;

open my $P, "|-", "gnuplot" or die; 
printflush $P qq[
        unset key
        plot "$N" with lines lw 3
]; 
<STDIN>; 
close $P;