use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Algorithm::Fuzzy::Chelly',
    license             => 'artistic2',
    dist_author         => 'Zeineb Chelly',
    dist_version_from   => 'lib/Algorithm/Fuzzy/Chelly.pm',
    requires => {
        'Test::More' => 0,
        'version'    => 0,
	'Switch'     => 0,
    },
    add_to_cleanup      => [ 'Algorithm-Fuzzy-Chelly-*' ],
);

$builder->create_build_script();
