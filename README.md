# NAME

Class::Accessor::Lite::InsideOut - Creates inside-out accessors easily

# SYNOPSIS

    package Foo;
    use Class::Accessor::Lite::InsideOut
        rw => [ 'name' ];

    sub new {
        my ($class, $string) = @_;
        bless \$string, $class; # not a blessed hashref
    }

    my $foo = Foo->new('xxx');
    $foo->name('blah');

# DESCRIPTION

Class::Accessor::Lite::InsideOut provides functionality to create accessors
by the inside-out technique, useful for non-hashref based classes.

# LICENSE

Copyright (C) motemen.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

motemen <motemen@gmail.com>
