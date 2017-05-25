use Mojo::Base -strict;

# Disable IPv6 and libev
BEGIN {
  $ENV{MOJO_NO_IPV6} = 1;
  $ENV{MOJO_REACTOR} = 'Mojo::Reactor::Poll';
}

use Test::More 'no_plan';
use Cwd 'abs_path';
use File::Basename 'dirname';
use File::Spec::Functions 'catfile';
use Mojolicious::Lite;
use Test::Mojo;

# Default
app->config(section => {foo => 'start'});

# Set config_override
app->config(config_override => 1);

# Load plugins
my $config = plugin INIConfig => {
  file => abs_path(catfile(dirname(__FILE__), 'ini_config_lite_app.ini'))
};

is($config->{section}{foo}, 'start');
ok(!defined $config->{section}{utf});
is(app->config->{section}{foo}, 'start');
ok(!defined app->config->{section}{utf});
is(app->config('section')->{foo}, 'start');
ok(!defined app->config('section')->{utf});
