use strict;
use warnings;


my $a = 16;
my @array_1D = ( [5, 2, 1, 8, 1, 2] );
my @array_2d = ([5,4,2,8],[5,2,1,4]); #resultado 2.0879116360612584
my @array_2d = ([5,4,2,8,6],[5,2,1,4,3]); #resultado 2.0


sub sum{
    my $sum=0;
    print @_;
    my @array_in = @_;
    my $length_array = scalar @array_in;
    foreach my $i (0..$length_array-1){
        $sum += $array_in[$i];
    }
    return $sum;
}

sub mean{
  my $mean=0;
  my @array = @{pop @_};
  my $length_array = scalar @array;
  my $suma = sum(@array);
  $mean = $suma/$length_array;
  return $mean;
}


sub std{
    if (!@_) { # comprobamos que existan elementos dentro de la llamada de la función
        print "TypeError: _std_dispatcher() missing 1 required positional argument: 'a'\n";
        return;
    }
    
  #sort(a, axis=- 1, kind=None, order=None)
    
    my ($array_ref, $var1, $var2, $var3, $var4, $var5, $var6,$var7) = @_;
  
    #esto es por defecto son los valores que tendrán asignados
    my ($axis, $dType, $out, $ddof, $keepdims, $symbol, $where) = (-1, "None", "None",0,"<no value>", "*", "<no value>");
    
    #Si los parámetros vienen de strings.
    $var1 =~ s/\s*//g if defined $var1 && ref \$var1 eq 'SCALAR';#Elimina los espacios en blanco
    $var2 =~ s/\s*//g if defined $var2 && ref \$var2 eq 'SCALAR';
    $var3 =~ s/\s*//g if defined $var3 && ref \$var3 eq 'SCALAR';
    
    $axis = $1 if (defined $var1 && $var1 =~ /^(?:axis=)?(-?\d+|None)$/i);#Se asume respetar el orden del parámetro $axis.
    $axis = $1 if (defined $var2 && $var2 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $axis = $1 if (defined $var3 && $var3 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $axis = $1 if (defined $var4 && $var4 =~ /^axis=(-?\d+|None)$/i);#Se asume respetar el orden del parámetro $axis.
    $axis = $1 if (defined $var5 && $var5 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $axis = $1 if (defined $var6 && $var6 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $axis = $1 if (defined $var7 && $var7 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    
    $dType = $1 if (defined $var2 && $var2 =~ /^(?:dType=)?(-?\d+|None)$/i);#Se asume respetar el orden del parámetro $kind.
    $dType = $1 if (defined $var1 && $var1 =~ /^dType=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $dType = $1 if (defined $var3 && $var3 =~ /^dType=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $dType = $1 if (defined $var4 && $var4 =~ /^dType=(-?\d+|None)$/i);#Se asume respetar el orden del parámetro $kind.
    $dType = $1 if (defined $var5 && $var5 =~ /^dType=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $dType = $1 if (defined $var6 && $var6 =~ /^dType=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $dType = $1 if (defined $var7 && $var7 =~ /^dType=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    
    $out = $1 if (defined $var3 && $var3 =~ /^(?:out=)?(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.
    $out = $1 if (defined $var1 && $var1 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var2 && $var2 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var4 && $var4 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.
    $out = $1 if (defined $var5 && $var5 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var6 && $var6 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var7 && $var7 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    
    $out = $1 if (defined $var3 && $var3 =~ /^(?:out=)?(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.
    $out = $1 if (defined $var1 && $var1 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var2 && $var2 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var4 && $var4 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.
    $out = $1 if (defined $var5 && $var5 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var6 && $var6 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $out = $1 if (defined $var7 && $var7 =~ /^out=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    
    $ddof = $1 if (defined $var4 && $var4 =~ /^(?:ddof=)?(-?\d+|None)$/i);#Se asume respetar el orden del parámetro $axis.
    $ddof = $1 if (defined $var2 && $var2 =~ /^ddof=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $ddof = $1 if (defined $var3 && $var3 =~ /^ddof=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.#Considerar también que los parámetros nombrados explicitamente pueden venir de HASHES.
    $ddof = $1 if (defined $var1 && $var1 =~ /^ddof=(-?\d+|None)$/i);#Se asume respetar el orden del parámetro $axis.
    $ddof = $1 if (defined $var5 && $var5 =~ /^ddof=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $ddof = $1 if (defined $var6 && $var6 =~ /^ddof=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.#Considerar también que los parámetros nombrados explicitamente pueden venir de HASHES.
    $ddof = $1 if (defined $var7 && $var7 =~ /^ddof=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.#Considerar también que los parámetros nombrados explicitamente pueden venir de HASHES.

    $keepdims = $1 if (defined $var5 && $var5 =~ /^(?:keepdims=)?(quicksort|mergesort|heapsort|stable)$/i);#Se asume respetar el orden del parámetro $$axis = $var2->{axis} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{axis};
    $keepdims = $1 if (defined $var1 && $var1 =~ /^keepdims=(quicksort|mergesort|heapsort|stable)$/i);#Explicitamente intercambiado el orden del parám$axis = $var3->{axis} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{axis};
    $keepdims = $1 if (defined $var3 && $var3 =~ /^keepdims=(quicksort|mergesort|heapsort|stable)$/i);#Explicitamente intercambiado el orden del parám
    $keepdims = $1 if (defined $var4 && $var4 =~ /^keepdims=(quicksort|mergesort|heapsort|stable)$/i);#Se asume respetar el orden del parámetro $$axis = $var2->{axis} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{axis};
    $keepdims = $1 if (defined $var1 && $var1 =~ /^keepdims=(quicksort|mergesort|heapsort|stable)$/i);#Explicitamente intercambiado el orden del parám$axis = $var3->{axis} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{axis};
    $keepdims = $1 if (defined $var6 && $var6 =~ /^keepdims=(quicksort|mergesort|heapsort|stable)$/i);#Explicitamente intercambiado el orden del parám
    $keepdims = $1 if (defined $var7 && $var7 =~ /^keepdims=(quicksort|mergesort|heapsort|stable)$/i);#Explicitamente intercambiado el orden del parám

    
    $symbol = $1 if (defined $var6 && $var6 =~ /^(?:symbol=)?(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.$kind = $var2->{kind} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{kind};
    $symbol = $1 if (defined $var1 && $var1 =~ /^symbol=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.$kind = $var3->{kind} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{kind};
    $symbol = $1 if (defined $var2 && $var2 =~ /^symbol=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $symbol = $1 if (defined $var3 && $var3 =~ /^symbol=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.$kind = $var2->{kind} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{kind};
    $symbol = $1 if (defined $var4 && $var4 =~ /^symbol=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.$kind = $var3->{kind} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{kind};
    $symbol = $1 if (defined $var5 && $var5 =~ /^symbol=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $symbol = $1 if (defined $var7 && $var7 =~ /^symbol=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    
    $where = $1 if (defined $var7 && $var7 =~ /^(?:where=)?(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.$kind = $var2->{kind} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{kind};
    $where = $1 if (defined $var1 && $var1 =~ /^where=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.$kind = $var3->{kind} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{kind};
    $where = $1 if (defined $var2 && $var2 =~ /^where=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $where = $1 if (defined $var3 && $var3 =~ /^where=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Se asume respetar el orden del parámetro $kind.$kind = $var2->{kind} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{kind};
    $where = $1 if (defined $var4 && $var4 =~ /^where=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.$kind = $var3->{kind} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{kind};
    $where = $1 if (defined $var5 && $var5 =~ /^where=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    $where = $1 if (defined $var6 && $var6 =~ /^where=(-?\d+|\[(?:\d+,)*\d+\])$/i);#Explicitamente intercambiado el orden del parámetro $kind.
    
    #Considerar también que los parámetros nombrados explicitamente pueden venir de HASHES.
    $axis = $var1->{axis} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{axis};
    $axis = $var2->{axis} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{axis};
    $axis = $var3->{axis} if defined $var3 && ref $var3 eq 'HASH' && exists $var3->{axis};
    $axis = $var4->{axis} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{axis};
    $axis = $var5->{axis} if defined $var5 && ref $var5 eq 'HASH' && exists $var5->{axis};
    $axis = $var6->{axis} if defined $var6 && ref $var6 eq 'HASH' && exists $var6->{axis};
    $axis = $var7->{axis} if defined $var7 && ref $var7 eq 'HASH' && exists $var7->{axis};
    
    $dType = $var1->{dType} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{dType};
    $dType = $var2->{dType} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{dType};
    $dType = $var3->{dType} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{dType};
    $dType = $var4->{dType} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{dType};
    $dType = $var5->{dType} if defined $var5 && ref $var5 eq 'HASH' && exists $var5->{dType};
    $dType = $var6->{dType} if defined $var6 && ref $var6 eq 'HASH' && exists $var6->{dType};
    $dType = $var7->{dType} if defined $var7 && ref $var7 eq 'HASH' && exists $var7->{dType};

    $out = $var1->{out} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{out};
    $out = $var2->{out} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{out};
    $out = $var3->{out} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{out};
    $out = $var4->{out} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{out};
    $out = $var5->{out} if defined $var5 && ref $var5 eq 'HASH' && exists $var5->{out};
    $out = $var6->{out} if defined $var6 && ref $var6 eq 'HASH' && exists $var6->{out};
    $out = $var7->{out} if defined $var7 && ref $var7 eq 'HASH' && exists $var7->{out};

    $ddof = $var1->{ddof} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{ddof};
    $ddof = $var2->{ddof} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{ddof};
    $ddof = $var3->{ddof} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{ddof};
    $ddof = $var4->{ddof} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{ddof};
    $ddof = $var5->{ddof} if defined $var5 && ref $var5 eq 'HASH' && exists $var5->{ddof};
    $ddof = $var6->{ddof} if defined $var6 && ref $var6 eq 'HASH' && exists $var6->{ddof};
    $ddof = $var7->{ddof} if defined $var7 && ref $var7 eq 'HASH' && exists $var7->{ddof};

    $keepdims = $var1->{keepdims} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{keepdims};
    $keepdims = $var2->{keepdims} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{keepdims};
    $keepdims = $var3->{keepdims} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{keepdims};
    $keepdims = $var4->{keepdims} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{keepdims};
    $keepdims = $var5->{keepdims} if defined $var5 && ref $var5 eq 'HASH' && exists $var5->{keepdims};
    $keepdims = $var6->{keepdims} if defined $var6 && ref $var6 eq 'HASH' && exists $var6->{keepdims};
    $keepdims = $var7->{keepdims} if defined $var7 && ref $var7 eq 'HASH' && exists $var7->{keepdims};

    $symbol = $var1->{symbol} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{symbol};
    $symbol = $var2->{symbol} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{symbol};
    $symbol = $var3->{symbol} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{symbol};
    $symbol = $var4->{symbol} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{symbol};
    $symbol = $var5->{symbol} if defined $var5 && ref $var5 eq 'HASH' && exists $var5->{symbol};
    $symbol = $var6->{symbol} if defined $var6 && ref $var6 eq 'HASH' && exists $var6->{symbol};
    $symbol = $var7->{symbol} if defined $var7 && ref $var7 eq 'HASH' && exists $var7->{symbol};

    $where = $var1->{where} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{where};
    $where = $var2->{where} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{where};
    $where = $var3->{where} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{where};
    $where = $var4->{where} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{where};
    $where = $var5->{where} if defined $var5 && ref $var5 eq 'HASH' && exists $var5->{where};
    $where = $var6->{where} if defined $var6 && ref $var6 eq 'HASH' && exists $var6->{where};
    $where = $var7->{where} if defined $var7 && ref $var7 eq 'HASH' && exists $var7->{where};
    
    #return $std = sqrt(mean(@array));

    my @shape_arr = shape([@{$array_ref}]);
    if ($axis =~ /\d+/ && scalar(@shape_arr) <= $axis){
      print STDERR "AxisError: axis $axis is out of bounds for array of dimension ", scalar(@shape_arr), "\n";
      return;
    }
    if ($axis =~ /None/i){
      my @aux2_arr = explode_array(@{$array_ref});
      $sort_f->(\@aux2_arr);
      return @aux2_arr;
    }elsif($axis =~ /\d+/){
      return sort_by_axis($array_ref, $axis, 0, $sort_f);#Initial axis==0 because the external brackets pair has been previously removed.
    }
    
    return @{$array_ref};
}


sub shape{
  #Vamos a crear una función interna shape2 para recibir separadamente dos argumentos:
  #la referencia al arreglo de entrada y la referencia al arreglo output de la recursión.
  #Los tamaños de cada eje son almacenadas recursivamente en el arreglo output de la recursión.
  
  return shape2(\@_, []);#Dos argumentos: Referencia al arreglo de entrada y la referencia a un arreglo vacío.
  
  sub shape2{
    my ($input_arr_ref, $output_arr_ref) = @_;

    my $last_input_arr_ref = @{$input_arr_ref}[-1];#Del arreglo de entrada, se obtiene una referencia al último elemento que puede ser un arreglo interno o finalmente un escalar.
    my @aux_input_arr = ref $last_input_arr_ref eq "ARRAY" ? @{$last_input_arr_ref} : ();#Arreglo auxiliar desarma el arreglo externo [].
    if (@aux_input_arr || scalar(@{$input_arr_ref}) == 1 && ref \@{$input_arr_ref} eq "ARRAY" && ref @{$input_arr_ref}[0] eq "ARRAY"){
      push @{$output_arr_ref}, scalar(@aux_input_arr);
    }
    
    if (!@aux_input_arr){#Arreglo auxiliar vacío.
      return @{$output_arr_ref};
    }else{
      shape2(\@aux_input_arr, $output_arr_ref);
    }
  }
}