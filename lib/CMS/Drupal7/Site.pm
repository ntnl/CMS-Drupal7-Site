package CMS::Drupal7::Site;
# Perl class to access Drupal CMS version 7 site - it's DB and files.
# Copyright (C) 2013 Bartłomiej Syguła
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use warnings;

our $VERSION = '0.0.1';

use CMS::Drupal7::Site::DB;

use Carp::Assert::More qw( assert_defined assert_hashref );
use File::Slurp qw( read_file );

my %__db_settings_keys = (
    # Mandatory parameters:
    driver   => 1,
    database => 1,

    # Optional parameters:
    host     => 1,
    username => 1,
    port     => 1,
    password => 1,
    prefix   => 1,

    # Recognized, but ignored, either always or in most cases:
    collation=> 1,
);

sub new { # {{{
    my ($class, %O) = @_;

    my $self = {
        debug => ( $O{'debug'} or 0 ),

        db_settings => {}, # Placeholder for database-related settings.

        __DB => undef, # Placeholder for CMS::Drupal7::Site::DB
    };

    bless $self, $class;

    if ($O{'settings_file'}) {
        $self->__parse_settings_file($O{'settings_file'});
    }

    if ($O{'database'}) {
        assert_hashref($O{'database'}, q{If given, 'database' should be a HASH ref});

        foreach my $k (keys %__db_settings_keys) {
            if (defined $O{'database'}->{$k}) {
                $self->{'db_settings'}->{$k} = $O{'database'}->{$k};
            }
        }
    }

    if ($O{'files'}) {
        if (not -x $O{'files'}) {
            confess('Path does not exist: ' . $O{'files'});
        }

        if (not -d $O{'files'}) {
            confess('Is not a directory: ' . $O{'files'});
        }

        $self->{'files'} = $O{'files'};
    }

    return $self;
} # }}}

sub get_dbh { # {{{
    my ($self) = @_;

    # Connect to DB, if not already connected.
    if (not $self->{'__DB'}) {
        # Check if DB settings have been auto-detected or ware given.
        assert_hashref($self->{'db_settings'}, 'DB settings are present');

        # Spawn a CMS::Drupal7::Site::DB object, that will handle DB access for us.
        $self->{'__DB'} = CMS::Drupal7::Site::DB->new(%{ $self->{'db_settings'} });
    }

    return $self->{'__DB'}->dbh();
} # }}}

sub __parse_settings_file { # {{{
    my ($self, $settings_file) = @_;

    my $settings_file_contents = read_file($settings_file);

    if ($settings_file_contents =~ m{\$databases.*?=.*?array.*?\(.*?'default'.*?=>.*?array.*?\(.*?'default'.*?=>.*?array.*?\((.+?).*?\).*?\);}si) {
        my $db_settings_string = $1;

        while ($db_settings_string =~ m{'([a-z]+).*?=>.*?'(.+?)',}) {
            my $k = $1;
            my $v = $2;

            if ($__db_settings_keys{$k}) {
                _debug("Found DB option: '$k' = '$v'");

                $self->{'db_settings'}->{$k} = $v;
            }
        }
    }

    return;
} # }}}

# vim: fdm=marker
1;
