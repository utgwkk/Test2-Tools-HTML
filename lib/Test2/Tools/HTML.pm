package Test2::Tools::HTML;
use strict;
use warnings;

our $VERSION = "0.01";

use Test::HTML::Differences;
use Test2::Compare::HTML ();

use Exporter 'import';
our @EXPORT = qw(html);

sub html ($) {
    my $html = shift;
    my @caller = caller;

    return Test2::Compare::HTML->new(
        file  => $caller[1],
        lines => [$caller[2]],
        html  => Test::HTML::Differences::normalize_html($html),
    );
}

1;
__END__

=encoding utf-8

=head1 NAME

Test2::Tools::HTML - It's new $module

=head1 SYNOPSIS

    use Test2::Tools::HTML;

=head1 DESCRIPTION

Test2::Tools::HTML is ...

=head1 LICENSE

Copyright (C) utgwkk.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

utgwkk E<lt>utagawakiki@gmail.comE<gt>

=cut

