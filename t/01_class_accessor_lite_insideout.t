use strict;
use warnings;
use Test::More;

{
    package FooString;
    use Class::Accessor::Lite::InsideOut
        rw => [ 'name' ];

    sub new {
        my ($class, $string) = @_;
        bless \$string, $class;
    }
}

{
    my $foo = FooString->new('bar');
    is $$foo, 'bar', 'isa blessed string ref';

    $foo->name(1);
    is $foo->name, 1;

    $foo->name(2);
    is $foo->name, 2;
}

is_deeply \%Class::Accessor::Lite::InsideOut::Fields, {},
          'garbage collected';

done_testing;
