# NAME

Test2::Tools::HTML - Compare HTML string with Test2

# SYNOPSIS

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

# DESCRIPTION

Test2::Tools::HTML provides comparison tools for HTML string.
This module was inspired by [Test::HTML::Differences](https://metacpan.org/pod/Test%3A%3AHTML%3A%3ADifferences) and [Test2::Tools::JSON](https://metacpan.org/pod/Test2%3A%3ATools%3A%3AJSON).

# FUNCTIONS

- $check = html($expected)

    Verify the value in the `$got` HTML string has the same HTML structure as `$expected`.

        is '<img src="a.gif" />', html('<img src="a.gif">');

# SEE ALSO

[Test::HTML::Differences](https://metacpan.org/pod/Test%3A%3AHTML%3A%3ADifferences)

[Test2::Suite](https://metacpan.org/pod/Test2%3A%3ASuite), [Test2::Tools::Compare](https://metacpan.org/pod/Test2%3A%3ATools%3A%3ACompare)

# LICENSE

Copyright (C) utgwkk.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

utgwkk <utagawakiki@gmail.com>
