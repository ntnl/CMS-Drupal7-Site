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

use Test::More;

plan tests => 2;

use_ok('CMS::Drupal7::Site');
use_ok('CMS::Drupal7::Site::DB');

# vim: fdm=marker
