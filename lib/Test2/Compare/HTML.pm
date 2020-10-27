package Test2::Compare::HTML;
use strict;
use warnings;
use parent 'Test2::Compare::Base';
use Test::HTML::Differences;
use Test2::Util::HashBase qw(raw_html html);

sub operator { 'HTML' }

sub name { shift->{+RAW_HTML} }

sub verify {
    my ($self, %params) = @_;

    return 0 unless $params{exists};
    return 0 unless length $params{got};
    return 1;
}

sub deltas {
    my ($self, %params) = @_;

    my $check = $params{convert}->($self->{+HTML});

    return $check->run(
        id => [META => 'HTML'],
        convert => $params{convert},
        seen => $params{seen},
        got => Test::HTML::Differences::normalize_html($params{got}),
        exists => 1,
    );
}

1;
