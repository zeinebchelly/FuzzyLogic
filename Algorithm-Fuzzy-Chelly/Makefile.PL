use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Algorithm::Fuzzy::Chelly',
    AUTHOR              => 'Zeineb Chelly',
    VERSION_FROM        => 'lib/Algorithm/Fuzzy/Chelly.pm',
    ABSTRACT_FROM       => 'lib/Algorithm/Fuzzy/Chelly.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
	'Switch' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Algorithm-Fuzzy-Chelly-*' },
);
