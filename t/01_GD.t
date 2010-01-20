use strict;
use Test::Requires 'GD';
use Test::More;
use t::lib::TestAnyImage;

for my $driver ( undef, 'GD' ) {
    t::lib::TestAnyImage::run_basic_tests($driver);
}


done_testing;

