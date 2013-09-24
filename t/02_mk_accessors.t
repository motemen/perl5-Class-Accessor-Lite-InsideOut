use strict;
use warnings;
use Test::More;

{
    package BarArray;
    use Class::Accessor::Lite::InsideOut;

    Class::Accessor::Lite::InsideOut->mk_accessors('x', 'y');

    sub new {
        return bless [ 1,2,3 ];
    }
}

my $bar = BarArray->new;
is_deeply [ @$bar ], [ 1,2,3 ];

$bar->x('X');
is $bar->x, 'X';

$bar->x('X2');
is $bar->x, 'X2';

done_testing;
