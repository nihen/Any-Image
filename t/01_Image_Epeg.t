use strict;
use Test::Requires 'Image::Epeg';
use Test::More;
use t::lib::TestAnyImage;

for my $driver ( undef, 'Image::Epeg' ) {
    t::lib::TestAnyImage::run_basic_tests($driver);
}


done_testing;

