use inc::Module::Install;
name 'Any-Image';
all_from 'lib/Any/Image.pm';
readme_from 'lib/Any/Image.pm';
githubmeta;

requires 'UNIVERSAL::require';

recommends 'Imager';
recommends 'GD';
recommends 'Image::Imlib2';
recommends 'Image::Magick';
recommends 'Image::Epeg' => 0.09;

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
build_requires 'Test::Requires';
auto_set_repository;
auto_include;
WriteAll;
