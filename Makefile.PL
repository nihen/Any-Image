use inc::Module::Install;
name 'Any-Image';
all_from 'lib/Any/Image.pm';
readme_from 'lib/Any/Image.pm';
readme_markdown_from 'lib/Any/Image.pm';
readme_pod_from 'lib/Any/Image.pm';
githubmeta;

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
