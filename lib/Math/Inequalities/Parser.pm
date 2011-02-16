package Math::Inequalities::Parser;
use strict;
use warnings;
use Carp qw/ croak /;
use Exporter qw/ import /;

our @EXPORT = qw/ parse_inequality /;

sub parse_inequality {
    my ($string) = @_;
    $string ||= '';
    if ($string =~ /^\s*(\d+)\s*<\s*n\s*<\s*(\d+)\s*$/ ) {
        return ($1+1, $2-1);
    }
    elsif ($string =~ /^\s*(\d+)\s*<\s*n/ ) {
        return ($1+1, undef);
    }
    elsif ($string =~ /^\s*(\d+)\s*>\s*n\s*$/ ) {
        return (undef, $1-1);
    }
    elsif ($string =~ /^\s*n\s*>\s*(\d+)\s*$/ ) {
        return ($1+1, undef);
    }
    elsif ($string =~ /^\s*n\s*<\s*(\d+)\s*$/ ) {
        return (undef, $1-1);
    }
    elsif ($string =~ /^\s*(\d+)\s*$/ ) {
        return ($1, $1);
    }
    elsif (length $string) {
        croak "Cannot parse '$string' as an inequality.";
    }
    return (undef, undef);
}

1;

=head1 NAME

Math::Inequalities::Parser - Minimum and maximum values allowed by an inequality.

=head1 SYNOPSIS

    use Math::Inequalities::Parser;
    
    my ($min, $max) = parse_inequality( ' 10 < n < 20 ' );
    # $min = 11
    # $max = 19

=head1 DESCRIPTION

Trivial library for parsing integer maximum and minimum out when given an arbitrary inequality.

=head1 FUNCTIONS

=head2 parse_inequality

Parses an inequality string and returns a list of two values, the minimum and the maxium value
that string will allow.

=head1 BUGS

=over

=item B<DOES NOT> support the C<< <= >> or C<< >= >> operators. Patch very welcome.

=item Does not work with negative numbers. Patches welcome.

=item Always uses C<< n >> as the number identifier, this should be configureable at import time.

=item Uses Exporter (should use Sub::Exporter)

=item B<DOES NOT> work with floating point numbers. I consider this a feature.

=back

=head1 AUTHORS

Tomas Doran (t0m) C<< <bobtfish@bobtfish.net> >>

Dave Lambley

=head1 COPYRIGHT & LICENSE

Copyright 2011 the above author(s).

This sofware is free software, and is licensed under the same terms as perl itself.

=cut

