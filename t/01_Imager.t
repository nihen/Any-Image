use strict;
use Test::Requires 'Imager';
use Test::More;
use t::lib::TestAnyImage;

$Any::Image::GUESS_DRIVERS = ['Imager'];
for my $driver ( undef, 'Imager' ) {
    t::lib::TestAnyImage::run_basic_tests($driver);
}


done_testing;

