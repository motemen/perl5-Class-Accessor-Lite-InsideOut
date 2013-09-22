use strict;
use warnings;
use Test::More;

{
    package FooString;
    use Class::Accessor::Lite::InsideOut
        rw => [ 'name' ];

    sub new {
        bless \do { my $o = '' };
    }
}

{
    my $foo = FooString->new;
    is $$foo, '';
    $foo->name(1);
    is $foo->name, 1;
    $foo->name(2);
    is $foo->name, 2;
}

is_deeply \%Class::Accessor::Lite::InsideOut::Fields, {},
          'garbage collected';

done_testing;
