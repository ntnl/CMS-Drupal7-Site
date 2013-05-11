#!/usr/bin/perl
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

use strict; use warnings;
use FindBin qw( $Bin );
use lib $Bin .q{/../lib};

use CMS::Drupal7::Site::Test::Toolkit;
use CMS::Drupal7::Site::DB;

use Test::More;

plan tests =>
    + 1 # isa OK
    + 2 # ->dbh tests
    + 1 # ->dbh_do tests
;

my $test_db_settings = CMS::Drupal7::Site::Test::Toolkit::init_fake_db();

my $db_object = CMS::Drupal7::Site::DB->new(
    %{ $test_db_settings },
);
isa_ok($db_object, 'CMS::Drupal7::Site::DB');

# We are going to use a real do ;) Sounds so serious, isn't it?
my $sth;

# Check the ->dbh method.
my $dbh = $db_object->dbh();
isa_ok($dbh, 'DBI::db');

$sth = $dbh->prepare('SELECT 42');
$sth->execute();
is($sth->fetchrow_array(), 42, 'dbh is usable');

# Crete some structure using dbh_do
$db_object->dbh_do('CREATE TABLE dbh_do_test ( test_value INTEGER NOT NULL )');
$db_object->dbh_do('INSERT INTO dbh_do_test (test_value) VALUES (84)');

# See, if those structures ware in fact created.
$sth = $dbh->prepare('SELECT * FROM dbh_do_test');
$sth->execute();
is($sth->fetchrow_array(), 84, 'dbh_do works');

# vim: fdm=marker
