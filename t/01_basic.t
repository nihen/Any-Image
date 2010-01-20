use strict;
use Test::More;

use Any::Image;

for my $driver ( undef, qw/Image::Imlib2 Imager Image::Magick GD Image::Epeg/ ) {
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


done_testing;
