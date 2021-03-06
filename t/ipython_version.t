use Test::More;

use version;
use File::Which;

plan tests => 2;

my ($ipython) = grep { -x which($_) } qw(jupyter ipython ipython3 ipython2);

ok( defined $ipython, "Found ipython: $ipython");

my $version = qx|$ipython --version|;
warn "Python is $ipython/$version";
$version =~ s/-dev$//; # remove dev suffix
ok( version->parse($version) >= version->parse(1.0), 'IPython frontend version must be >= 1.0' );

done_testing;
