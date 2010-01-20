use strict;
use Test::Requires 'Image::Magick';
use Test::More;
use t::lib::TestAnyImage;

for my $driver ( undef, 'Image::Magick' ) {
    t::lib::TestAnyImage::run_basic_tests($driver);
}


done_testing;

