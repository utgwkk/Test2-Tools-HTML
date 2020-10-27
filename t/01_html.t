use Test2::V0;
use Test2::Tools::HTML;

is '<img src="a.gif" />', html('<img src="a.gif">');
is '<img src="a.gif">', html('<img src="a.gif" />');

is "<body>\nhello\n</body>", html('<body>hello</body>');
is '<body>hello</body>', html("<body>\nhello\n</body>");

is <<HTML, html('<!DOCTYPE html><html><body><h1>Hello, world!</h1></body></html>');
    <!DOCTYPE html>
    <html>
    <body>
        <h1>Hello, world!</h1>
    </body>
    </html>
HTML

subtest 'pass' => sub {
    my $line;
    my $events = intercept {
        $line = __LINE__ + 1;
        is '<p><span class="got">hoge</span></p>', html('<p><span class="got">hoge</span></p>');
    };
    is $events, array {
        item event Ok => sub {
            call pass => T;
            prop file => __FILE__;
            prop line => $line;
        };
    };
};

subtest 'fail' => sub {
    my $line;
    my $events = intercept {
        $line = __LINE__ + 1;
        is '<p><span class="got">hoge</span></p>', html('<p><span class="expected">hoge</span></p>');
    };
    is $events, array {
        item event Fail => sub {
            prop file => __FILE__;
            prop line => $line;
        };
    };
};

done_testing;
