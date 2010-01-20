package t::lib::TestAnyImage;
use strict;
use warnings;

use Test::More;

use Any::Image;

sub run_basic_tests {
    my $driver = shift;

    my $img = Any::Image->load('t/img/hoge.jpg', $driver ? {driver => $driver} : undef);

    ok 1, "Driver " . ($driver || 'auto');

    is $img->width  => 100;
    is $img->height => 50;

    $img->resize(50, 10);

    is $img->width  => 50;
    is $img->height => 10;

    $img->save('t/img/hoge_write.jpg');
    ok -f 't/img/hoge_write.jpg';

    my $new_img = Any::Image->load('t/img/hoge_write.jpg', , $driver ? {driver => $driver} : undef);
    is $new_img->width  => 50;
    is $new_img->height => 10;

    unlink 't/img/hoge_write.jpg';
}

1;
