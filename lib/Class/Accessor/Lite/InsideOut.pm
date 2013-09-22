package Class::Accessor::Lite::InsideOut;
use 5.008005;
use strict;
use warnings;
use Hash::Util::FieldHash::Compat qw(fieldhash);

our $VERSION = '0.01';

fieldhash our %Fields;

sub import {
    my ($class, %args) = @_;
    my $pkg = caller;

    foreach my $name (@{ $args{rw} || [] }) {
        no strict 'refs';
        *{"$pkg\::$name"} = mk_rw_accessor($name);
    }
}

sub mk_rw_accessor {
    my ($name) = @_;

    return sub {
        my $self = shift;
        $Fields{$self}{$name} = $_[0] if @_;
        return $Fields{$self}{$name};
    };
}

1;

__END__

=encoding utf-8

=head1 NAME

Class::Accessor::Lite::InsideOut - It's new $module

=head1 SYNOPSIS

    use Class::Accessor::Lite::InsideOut;

=head1 DESCRIPTION

Class::Accessor::Lite::InsideOut is ...

=head1 LICENSE

Copyright (C) motemen.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

motemen E<lt>motemen@gmail.comE<gt>

=cut

