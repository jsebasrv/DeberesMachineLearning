use strict;
use warnings;
use Switch;
use Data::Dump qw(dump);
# Array para el caso cuando es vacío
my @array_vacio = ();

#unique(@array_vacio);
print "\n";

#Caso cuando ingreso un array 1D
my @array_1D = ( [5, 2, 1, 8, 1, 2] );
my @array_2D = ([[5, 2, 1,2],[8, 1, 2,3],[5, 2, 1,5]],[[8, 1, 2,8],[5, 2, 1,7],[8, 1, 2,6]],[[5, 2, 1,4],[8, 1, 2,4],[5, 2, 1,2]]);
my $indices  = "index=true";
my $contador = "count=true";
my $inverse = "inverse=true";
my $axis = "axis=1";


#extract_dim(@array_2D);

#casos con un parámetro
print "Imprimo El array original \n";
print dump (@array_1D),"\n";
print "\n";

#casos con un parámetro
print "Imprimo Array unique \n";
print dump (unique(@array_2D,$axis)),"\n";
print "\n";

#casos con un parámetro
print "Imprimo Array unique con parámetro indexes \n";
print dump unique(@array_2D,$indices);
print "\n";
print "Imprimo Array unique con parámetro count \n";
print dump unique(@array_1D,$contador);
print "\n";
print "Imprimo Array unique con parámetro inverse\n";
print dump unique(@array_1D,$inverse);
print "\n";

#casos con dos parámetro
print "Imprimo Array unique con dos parámetro \n";
print dump unique(@array_2D,$indices,$contador);
print "\n";
print "Imprimo Array unique con dos parámetro \n";
print dump unique(@array_1D,$contador,$indices);
print "\n";
print "Imprimo Array unique con dos parámetro \n";
print dump unique(@array_2D,$contador,$inverse);
print "\n";

#casos con tres parámetro
print "Imprimo Array unique con tres parámetros \n";
print dump unique(@array_1D,$indices,$contador,$inverse);
print "\n";
print "Imprimo Array unique con tres parámetros \n";
print dump unique(@array_1D,$contador,$indices,$inverse);
print "\n";
print "Imprimo Array unique con tres parámetros \n";
print dump unique(@array_2D,$contador,$indices,$inverse);
print "\n";


#caso base
sub unique {
    
    if ( !@_ ) {
        print STDERR "TypeError: _unique_dispatcher() missing 1 required positional argument: 'ar' \n";
        return;
    }
    
    my ($array_ref, $var1, $var2, $var3,$var4) = @_;

    #esto es por defecto son los valores que tendrán asignados
    my ($index, $inverse, $count, $axis) = ("False", "False", "False","None");
    
    #Si los parámetros vienen de strings.
    $var1 =~ s/\s*//g if defined $var1 && ref \$var1 eq 'VSTRING';#Elimina los espacios en blanco
    $var2 =~ s/\s*//g if defined $var2 && ref \$var2 eq 'VSTRING';
    $var3 =~ s/\s*//g if defined $var3 && ref \$var3 eq 'VSTRING';
    $var4 =~ s/\s*//g if defined $var4 && ref \$var4 eq 'SCALAR';
    
       
    $index = $1 if (defined $var1 && $var1 =~ /^(?:index=)?(True|False)$/i);#Se asume respetar el orden del parámetro $index.
    $index = $1 if (defined $var2 && $var2 =~ /^index=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $index.
    $index = $1 if (defined $var3 && $var3 =~ /^index=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $index.
    $index = $1 if (defined $var4 && $var4 =~ /^index=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $index.
    
    $inverse = $1 if (defined $var2 && $var2 =~ /^(?:inverse=)?(True|False)$/i);#Se asume respetar el orden del parámetro $inverse.
    $inverse = $1 if (defined $var1 && $var1 =~ /^inverse=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $inverse.
    $inverse = $1 if (defined $var3 && $var3 =~ /^inverse=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $inverse.
    $inverse = $1 if (defined $var4 && $var4 =~ /^inverse=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $inverse.
    
    $count = $1 if (defined $var3 && $var3 =~ /^(?:count=)?(True|False)$/i);#Se asume respetar el orden del parámetro $count.
    $count = $1 if (defined $var1 && $var1 =~ /^count=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $count.
    $count = $1 if (defined $var2 && $var2 =~ /^count=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $count.
    $count = $1 if (defined $var4 && $var4 =~ /^count=(True|False)$/i);#Explicitamente intercambiado el orden del parámetro $count.
    
    $axis = $1 if (defined $var4 && $var4 =~ /^(?:axis=)?(-?\d+|None)$/i);#Se asume respetar el orden del parámetro $axis.
    $axis = $1 if (defined $var2 && $var2 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $axis = $1 if (defined $var1 && $var1 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    $axis = $1 if (defined $var3 && $var3 =~ /^axis=(-?\d+|None)$/i);#Explicitamente intercambiado el orden del parámetro $axis.
    
    #Considerar también que los parámetros nombrados explicitamente pueden venir de HASHES.
    $index = $var1->{index} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{index};
    $index = $var2->{index} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{index};
    $index = $var3->{index} if defined $var3 && ref $var3 eq 'HASH' && exists $var3->{index};
    $index = $var4->{index} if defined $var4 && ref $var4 eq 'HASH' && exists $var4->{index};
    
    $inverse = $var1->{inverse} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{inverse};
    $inverse = $var2->{inverse} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{inverse};
    $inverse = $var3->{inverse} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{inverse};
    $inverse = $var3->{inverse} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{inverse};
  
    $count = $var1->{count} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{count};
    $count = $var2->{count} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{count};
    $count = $var3->{count} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{count};
    $count = $var3->{count} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{count};
    
    $axis = $var1->{axis} if defined $var1 && ref $var1 eq 'HASH' && exists $var1->{axis};
    $axis = $var2->{axis} if defined $var2 && ref $var2 eq 'HASH' && exists $var2->{axis};
    $axis = $var3->{axis} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{axis};
    $axis = $var3->{axis} if defined $var3 && ref $var2 eq 'HASH' && exists $var3->{axis};
    

    if ($axis =~ /None/i){
        #my @aux2_arr = explode_array(@{$array_ref});
        #$sort_f->(\@aux2_arr);
        my @unique_array = @{uniqueNoParams(@{$array_ref})};
        return @unique_array;
    }elsif($axis =~ /\d+/){
        return unique1Par($array_ref, $axis, 0);#Initial axis==0 because the external brackets pair has been previously removed.
    }

    my @array = @{pop @_};
    
    my @sorted_array = ();
    my @unique       = ();
    my @params       = ();
    while ( $_[$#_] !~ /\d/ ) {
        push @params, pop @_;
    }

    my $params_length = @params;
    

    #verifico si no hay parámetros o que el array esté vacío
    

    if ( $params_length == 0 ) {

        #Tomo el primer parametro de entrada
        @sorted_array = sort_func(@array);
        @unique       = remove_repeats(@sorted_array);
        my $response = \@unique;
        return $response;
    }

    switch($params_length){

        case 1 {
            my @resp = &unique1Par( @array, @params );
            my @unique_vector = @{$resp[0]};
            my @resp_par1 = @{$resp[1]};
            return @unique_vector,"\t", @resp_par1;
        }
        case 2 {
            my @resp2 = &unique1Par( @array, $params[0] );
            my @resp1 = &unique1Par( @array, $params[1] );
            my @unique_vector = @{$resp1[0]};
            my @resp_par1 = @{$resp1[1]};
            my @resp_par2 = @{$resp2[1]};
            return @unique_vector,"\t", @resp_par1,"\t", @resp_par2;
        }
        case 3 {
            my @resp3 = &unique1Par( @array, $params[0] );
            my @resp2 = &unique1Par( @array, $params[1] );
            my @resp1 = &unique1Par( @array, $params[2] );
            my @unique_vector = @{$resp1[0]};
            my @resp_par1 = @{$resp1[1]};
            my @resp_par2 = @{$resp2[1]};
            my @resp_par3 = @{$resp3[1]};
            return @unique_vector,"\t", @resp_par1,"\t", @resp_par2,"\t", @resp_par3;
        }
        case 4 {
            unique1Par( @array, $params[0] );
            unique1Par( @array, $params[1] );
            unique1Par( @array, $params[2] );

            #analizar que pasa con el axis 0
            unique1Par( @array, $params[1] );
        }
        else { print "previous case not true" }
    }

}

sub uniqueNoParams{
    #Tomo el primer parametro de entrada
    my @sorted_array = sort_func(@_);
    my @unique       = remove_repeats(@sorted_array);
    my $response = \@unique;
    return $response;
}

sub unique1Par {
    
    my @array = @{$_[0]};
    my $axis = $_[1];
    my $curr_axis = $_[2];
    
    if (ref $array[0] ne "ARRAY"){
        my @unique_array = @{uniqueNoParams(@{\@array})};
        return @unique_array;
    }
    
    if ($axis == $curr_axis){
        my @shape_arr = shape([@array]);
        if (scalar(@shape_arr) > 2){#Recursion to decrease the current dimension of @array.
            for (my $i = 0; $i < @{$array[0]}; $i++){#Con scalar(@array) como condicóin de parada del for, se barren las filas de un arreglo bidimensional y no las columnas de una fila como se desea. Para barrer las columnas de un arreglo bidimensional use scalar(@{$array[0]}) o simplemente @{$array[0]}
                my @aux2_arr = map $_->[$i], @array;
                unique1Par(\@aux2_arr, $axis, $curr_axis);#No es necesario repetir el código como abajo porque @aux2_arr es alterado al pasarlo por referencia.
            }
        }else{#axis == $curr_axis in bidimensional array
            for (my $i = 0; $i < @{$array[0]}; $i++){#Con scalar(@array) como condicóin de parada del for, se barren las filas de un arreglo bidimensional y no las columnas de una fila como se desea. Para barrer las columnas de un arreglo bidimensional use @{$array[0]}
                #Se extrae cada una de las columnas usando la función map
                #y se las almacena en un arrelo @aux2_arr
                my @aux2_arr = map $_->[$i], @array;
                #Se ordena al arreglo que contiene los elementos de las columnas
                #$sort_f->(\@aux2_arr);
                for (my $j = 0 ; $j < @aux2_arr ; $j++){# Use @aux2_arr en lugar de @{$array[$i]} para no avanzar en posiciones no definidas del arreglo bidimensional.
                    #Se envian los elemento al arreglo @aux2_arr al arreglo original
                    $array[$j][$i] = $aux2_arr[$j];
                    #Para que el orden se mantenga se invirtieron los indices J % I
                }
            }
        }
  
    }else{#Recursion to get closer to the desired axis.
        for (my $i = 0; $i < scalar(@array); $i++){
            @{$array[$i]} = unique1Par(\@{$array[$i]}, $axis, $curr_axis+1);
        }
    }
    
    return @array;
    
    #if ( $_[$#_] =~ /index=true/ ) {
    #    pop @_;
    #    my @array   = @_;
    #    my @indices = ();
    #
    #    my $unique = unique(@array);
    #
    #    #print $unique;
    #    my @unique = @{$unique};
    #    foreach my $i ( 0 .. $#unique ) {
    #        push @indices, find_indexes( @array, $unique[$i] );
    #    }
    #    my $indices = \@indices;
    #
    #    return ( $unique, $indices );
    #}
    #elsif ( $_[$#_] =~ /count=true/ ) {
    #    pop @_;
    #    my @array = @_;
    #    my @count = ();
    #    my @sorted_array = sort_func(@array);
    #    @count = count(@sorted_array);
    #    my $count = \@count;
    #    my $unique = unique(@array);
    #    my @unique = @{$unique};
    #
    #    return ( $unique, $count );
    #}elsif($_[$#_] =~ /inverse=true/){
    #    pop @_;
    #    my @array = @_;
    #    my $unique = unique(@array);
    #    my @unique = @{$unique};
    #    my @inverse = @array;
    #    my @indices =();
    #    foreach my $i ( 0 .. $#unique ) {
    #        push @indices, find_indexes( @array, $unique[$i] );
    #    }
    #    for(my $i=0;$i<@unique;$i++){ 
    #        my $valor = $unique[$i];
    #        for(my $j=0;$j<@array;$j++){  
    #            if($array[$j] ==$valor ){
    #                $inverse[$j] = $indices[$i];
    #            }
    #        }
    #    }
    #    my $inverse = \@inverse;
    #    return ( $unique, $inverse );
    #}
}

sub sort_func {
    my $length_array = scalar @_;
    my @array_in     = @_;
    my @indices      = ();

    foreach my $i ( 0 .. $length_array - 1 ) {
        my $aux = 0;
        foreach my $j ( 0 .. $length_array - 2 ) {
            if ( $array_in[$j] > $array_in[ $j + 1 ] ) {

                #push @indices,indexes(@array_in,$array_in[$j]);
                $aux                = $array_in[$j];
                $array_in[$j]       = $array_in[ $j + 1 ];
                $array_in[ $j + 1 ] = $aux;
            }
        }
    }

    #print "Estoy en esta parte \n";
    #print @indices;
    return @array_in;
}

sub remove_repeats {
    my $length_array = scalar @_;
    my @array        = @_;
    my @unique_array = ();
    my @repetido     = ();
    while (@array) {
        if ( scalar @array > 1 ) {
            if ( $array[0] == $array[1] ) {
                @repetido = shift @array;
            }
            else {
                push @unique_array, $array[0];
                shift @array;
            }
        }
        else {
            push @unique_array, $array[0];
            shift @array;
        }
    }
    return @unique_array;
}

#para que se puedan contar los valores repetidos se debe ingresar como parametro un array ordenado
sub count {
    my $length_array  = scalar @_;
    my @array         = @_;
    my @count         = ();
    my $contador      = 0;
    my $first_element = $array[$contador];
    for ( my $i = 0 ; $i < $length_array ; $i++ ) {
        if ( $first_element == $array[$i] ) {
            $contador++;
        }
        else {
            push @count, $contador;
            $contador      = 1;
            $first_element = $array[$i];
        }
    }
    push @count, $contador;
    return @count;
}

sub find_indexes {
    my $number       = pop @_;
    my @array        = @_;
    my @indices      = ();
    my $length_array = scalar @_;
    my $i            = 0;
    while ( $i < $length_array ) {
        if ( $array[$i] == $number ) {
            return $i;
        }
        else {
            $i++;
        }

    }
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