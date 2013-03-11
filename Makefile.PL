use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::INIConfig',
  VERSION_FROM => 'lib/Mojolicious/Plugin/INIConfig.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {
    'Config::Tiny' => '2.14',
    'Mojolicious' => '2.98'
  },
  test         => {TESTS => 't/*.t'}
);
