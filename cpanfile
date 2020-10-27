requires 'Exporter';
requires 'HTML::Differences';
requires 'Test2::Suite';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

