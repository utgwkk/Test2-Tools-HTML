requires 'Exporter';
requires 'Test::HTML::Differences';
requires 'Test2::Suite';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test2::V0';
};

