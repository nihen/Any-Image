use strict;
use Test::Requires;
use Test::More;
use t::lib::TestAnyImage;

use Any::Image;

my %dep_version = (
    'Image::Epeg' => '0.09'
);

for my $driver ( @{$Any::Image::GUESS_DRIVERS} ) {
    subtest $driver => sub {
        test_requires $driver, $dep_version{$driver};
        local $Any::Image::GUESS_DRIVERS = [$driver];
        for my $_driver (undef, $driver) {
            t::lib::TestAnyImage::run_basic_tests($_driver);
        }
        done_testing;
    };
}


done_testing;

