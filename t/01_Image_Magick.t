use strict;
use Test::Requires 'Image::Magick';
use Test::More;
use t::lib::TestAnyImage;

$Any::Image::GUESS_DRIVERS = ['Image::Magick'];
for my $driver ( undef, 'Image::Magick' ) {
    t::lib::TestAnyImage::run_basic_tests($driver);
}


done_testing;

