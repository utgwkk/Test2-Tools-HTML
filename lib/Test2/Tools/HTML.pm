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
        file     => $caller[1],
        lines    => [$caller[2]],
        html     => Test::HTML::Differences::normalize_html($html, 1),
        raw_html => $html,
    );
}

1;
__END__

=encoding utf-8

=head1 NAME

Test2::Tools::HTML - Compare HTML string with Test2

=head1 SYNOPSIS

    use Test2::V0;
    use Test2::Tools::HTML;

    is '<img src="a.gif" />', html('<img src="a.gif">');
    is <<HTML, html('<!DOCTYPE html><html><body><h1>Hello, world!</h1></body></html>');
    <!DOCTYPE html>
    <html>
    <body>
        <h1>Hello, world!</h1>
    </body>
    </html>
    HTML

=head1 DESCRIPTION

Test2::Tools::HTML provides comparison tools for HTML string.
This module was inspired by L<Test::HTML::Differences> and L<Test2::Tools::JSON>.

=head1 FUNCTIONS
 
=over 4

=item $check = html($expected)

Verify the value in the C<$got> HTML string has the same HTML structure as C<$expected>.

    is '<img src="a.gif" />', html('<img src="a.gif">');

=back

=head1 SEE ALSO

L<Test::HTML::Differences>

L<Test2::Suite>, L<Test2::Tools::Compare>

=head1 LICENSE

Copyright (C) utgwkk.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

utgwkk E<lt>utagawakiki@gmail.comE<gt>

=cut

