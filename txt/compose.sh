#!/bin/sh
#
# compose.sh: a shell script for putting together help.txt, etc.
#
# Usage: compose.sh <directory>
# Example: compose.sh help
#
# This script calls index-files.pl
# 
# By Alan Schwartz (Javelin/Paul)
#

# These come from Configure
perl=/usr/bin/perl
test=/usr/bin/test
cat=/usr/bin/cat
rm=/usr/bin/rm
echo=/usr/bin/echo

# Force a standard locale for sorting purposes
LC_ALL=C

# What subdirectories should we be processing?
dir="$1"
if $test ! -d "$dir"; then
  $echo "Usage: compose.sh <directory>"
  exit 0
fi

# Ok, let's do 'em:
(
cd "$dir" &&

# Remove the old index
$rm -f "index.$dir" "../$dir.txt" &&

# Build a new index, and tack it on.
$echo "Building master file for $dir" &&
$cat ./*.$dir > "../$dir.txt"

)

$echo Done.
$echo Remember to use @readcache if the mush is currently running.

