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
#my @array_2D = ([[5, 2, 1,2],[8, 1, 2,3],[5, 2, 1,5]],[[8, 1, 2,8],[5, 2, 1,7],[8, 1, 2,6]],[[5, 2, 1,4],[8, 1, 2,4],[5, 2, 1,2]]);
my $indices  = "index=true";
my $contador = "count=true";
my $inverse = "inverse=true";


#extract_dim(@array_2D);

#casos con un parámetro
print "Imprimo El array original \n";
print dump (@array_1D),"\n";
print "\n";

#casos con un parámetro
print "Imprimo Array unique \n";
print dump (unique(@array_1D)),"\n";
print "\n";

#casos con un parámetro
print "Imprimo Array unique con parámetro indexes \n";
print unique(@array_1D,$indices);
print "\n";
print "Imprimo Array unique con parámetro count \n";
print unique(@array_1D,$contador);
print "\n";
print "Imprimo Array unique con parámetro inverse\n";
print unique(@array_1D,$inverse);
print "\n";

#casos con dos parámetro
print "Imprimo Array unique con dos parámetro \n";
print unique(@array_1D,$indices,$contador);
print "\n";
print "Imprimo Array unique con dos parámetro \n";
print unique(@array_1D,$contador,$indices);
print "\n";
print "Imprimo Array unique con dos parámetro \n";
print unique(@array_1D,$contador,$inverse);
print "\n";

#casos con tres parámetro
print "Imprimo Array unique con tres parámetros \n";
print unique(@array_1D,$indices,$contador,$inverse);
print "\n";
print "Imprimo Array unique con tres parámetros \n";
print unique(@array_1D,$contador,$indices,$inverse);
print "\n";
print "Imprimo Array unique con tres parámetros \n";
print unique(@array_1D,$contador,$indices,$inverse);
print "\n";



#print unique(@array_1D);


#unique(@array_2D);

#caso base
sub unique {
    
    if ( !@_ ) {
        print STDERR "TypeError: _unique_dispatcher() missing 1 required positional argument: 'ar' \n";
        return;
    }
    my $array_ref        = shift @_; #([5,2,1,8,1,2]);
    
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

sub unique1Par {
    if ( $_[$#_] =~ /index=true/ ) {
        pop @_;
        my @array   = @_;
        my @indices = ();

        my $unique = unique(@array);

        #print $unique;
        my @unique = @{$unique};
        foreach my $i ( 0 .. $#unique ) {
            push @indices, find_indexes( @array, $unique[$i] );
        }
        my $indices = \@indices;

        return ( $unique, $indices );
    }
    elsif ( $_[$#_] =~ /count=true/ ) {
        pop @_;
        my @array = @_;
        my @count = ();
        my @sorted_array = sort_func(@array);
        @count = count(@sorted_array);
        my $count = \@count;
        my $unique = unique(@array);
        my @unique = @{$unique};

        return ( $unique, $count );
    }elsif($_[$#_] =~ /inverse=true/){
        pop @_;
        my @array = @_;
        my $unique = unique(@array);
        my @unique = @{$unique};
        my @inverse = @array;
        my @indices =();
        foreach my $i ( 0 .. $#unique ) {
            push @indices, find_indexes( @array, $unique[$i] );
        }
        for(my $i=0;$i<@unique;$i++){ 
            my $valor = $unique[$i];
            for(my $j=0;$j<@array;$j++){  
                if($array[$j] ==$valor ){
                    $inverse[$j] = $indices[$i];
                }
            }
        }
        my $inverse = \@inverse;
        return ( $unique, $inverse );
    }

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

sub extract_dim{
    my @external_array = @_;
    my $external_array_length = scalar @external_array;
    my @internal_array = @{$external_array[0]};
    my $internal_array_length = scalar @internal_array;
    my @interna_array = @{$internal_array[0]};
    my $interna_array_length = scalar @interna_array;
    my @intern_arra = @{$interna_array[0]};
    my $interna_arra_length = scalar @intern_arra;

    print "Estoy en la impresion \n";
    print $external_array_length;
    print "\n";
    print $internal_array_length;
    print "\n";
    print $interna_array_length;
    print "\n";
    print $interna_arra_length;
    print "\n";
}