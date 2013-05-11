package CMS::Drupal7::Site::DB;
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

use Carp::Assert::More qw( assert_defined );
use DBI;
use SQL::Abstract;

# Drupal DB Connector for Perl.

sub new { # {{{
    my ($class, %db_settings) = @_;

    assert_defined($db_settings{'driver'}, q{Key: 'driver' is mandatory});

    my $self = {
        debug => ( $db_settings{'debug'} or 0 ),

        driver   => $db_settings{'driver'},
        host     => $db_settings{'host'},
        database => $db_settings{'database'},
        port     => $db_settings{'port'},

        username => ( $db_settings{'username'} or q{}),
        password => ( $db_settings{'password'} or q{}),

        prefix   => $db_settings{'prefix'},
        collation=> $db_settings{'collation'},
    };

    bless $self, $class;

    $self->__connect();

    assert_defined($self->{'dbh'}, 'dbh was correctly initialized');

    return $self;
} # }}}

sub __connect { # {{{
    my ($self) = @_;

    my $options = {
        AutoCommit => 1,
        RaiseError => 1
    };

    my $dbi_connection_string = q{DBI:};

    if ($self->{'driver'} eq 'mysql') {
        $dbi_connection_string .= q{mysql};
    }
    elsif ($self->{'driver'} eq 'pgsql') {
        $dbi_connection_string .= q{Pg};
    }
    elsif ($self->{'driver'} eq 'sqlite') {
        $dbi_connection_string .= 'SQLite';
    }

    if ($self->{'database'}) {
        $dbi_connection_string .= q{:dbname=} . $self->{'database'};
    }

    $self->{'dbh'} = DBI->connect($dbi_connection_string, $self->{'username'}, $self->{'password'}, $options);

    return;
} # }}}

sub dbh_do { # {{{
    my ($self, $do_sql, $do_attr, @do_bind) = @_;

    return $self->{'dbh'}->do($do_sql, $do_attr, @do_bind);
} # }}}

sub dbh { # {{{
    my ($self) = @_;

    return $self->{'dbh'};
} # }}}

# vim: fdm=marker
1;
