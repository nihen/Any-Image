use strict;
use Test::Requires 'Image::Imlib2';
use Test::More;
use t::lib::TestAnyImage;

$Any::Image::GUESS_DRIVERS = ['Image::Imlib2'];
for my $driver ( undef, 'Image::Imlib2' ) {
    t::lib::TestAnyImage::run_basic_tests($driver);
}


done_testing;

