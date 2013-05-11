package CMS::Drupal7::Site::Test::Toolkit;
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

use File::Temp qw( tempdir );
use Carp::Assert::More qw( assert_defined );

# Make a copy of bundled Drupal SQLite DB in /tmp directory.
# Finally, return db settings needed to connect to it.
sub init_fake_db { # {{{
    # Perhaps other versions will be present in future?
    my $db_file_name = q{drupal-7-19-db.sqlite};

    # Determine the location of the test DB file (SQLite).
    my $src_sqlite_path;
    foreach my $module (keys %INC) {
        # This will probably fail miserably on Windows.
        # (I'll FIXME if there is at least a single user needing this)
        if ($module eq 'CMS/Drupal7/Site/Test/Toolkit.pm') {
            $src_sqlite_path = $INC{$module};
            $src_sqlite_path =~ s{Toolkit.pm}{$db_file_name}s;

            last;
        }
    }

    assert_defined($src_sqlite_path, 'Source SQLite DB was found.');

    # Create a directory in tmp space, that can host our test DB.
    my $tmp_dir = tempdir( CLEANUP => 1 );

    my $dst_sqlite_path = $tmp_dir .q{/drupal.sqlite};

    # Prepare a copy, on which anything can be executed without dought.
    system q{cp}, $src_sqlite_path, $dst_sqlite_path;

    # Prepare and return DB settings, needed to connect to test DB.
    my %db_settings = (
        driver   => 'sqlite',
        database => $dst_sqlite_path,
    );

    return \%db_settings;
} # }}}

# vim: fdm=marker
1;
