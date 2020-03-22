#!/usr/bin/perl

# Status bar script for obtaining the current battery charge level.

# Copyright 2014 Pierre Mavro <deimos@deimos.fr> and Vivien Didelot <vivien@didelot.org>
# Licensed under the terms of the GNU GPL v3, or any later version.
#
# The color will gradually change for a percentage below 85%, and the urgency
# (exit code 33) is set if there is less that 5% remaining.

use strict;
use warnings;
use utf8;
use Sys::Hostname;

my $acpi;
my $status;
my $percent;
my $ac_adapt;
my $full_text;
my $short_text;
my $host;
my $bat_number = $ENV{BAT_NUMBER} || 0;
my $label = $ENV{LABEL} || "";
$host = hostname;

# Don't run on hosts that don't hace batteries.
if ($host eq 'tethys') {
    exit(0);
}

# read the first line of the "acpi" command output
open (ACPI, "acpi -b 2>/dev/null| grep 'Battery $bat_number' |") or die;
$acpi = <ACPI>;
close(ACPI);

# fail on unexpected output
if (not defined($acpi)) {
    # don't print anything to stderr if there is no battery
    exit(0);
}
elsif ($acpi !~ /: ([\w\s]+), (\d+)%/) {
	die "$acpi\n";
}

$status = $1;
$percent = $2;
$full_text = "$label$percent%";

if ($status eq 'Discharging') {
	$full_text .= ' ';
} elsif ($status eq 'Charging') {
	$full_text .= ' CHRG';
} elsif ($status eq 'Unknown') {
	open (AC_ADAPTER, "acpi -a |") or die;
	$ac_adapt = <AC_ADAPTER>;
	close(AC_ADAPTER);

	if ($ac_adapt =~ /: ([\w-]+)/) {
		$ac_adapt = $1;

		if ($ac_adapt eq 'on-line') {
			$full_text .= ' CHRG';
		} elsif ($ac_adapt eq 'off-line') {
			$full_text .= ' ';
		}
	}
}

$short_text = $full_text;

if ($acpi =~ /(\d\d:\d\d):/) {
	$full_text .= " ($1)";
}

# print text
print " $full_text\n";
print " $short_text\n";

# consider color and urgent flag only on discharge
if ($status eq 'Discharging') {

	if ($percent < 10) {
		print "#FF0000\n";
	} elsif ($percent < 20) {
		print "#FFAE00\n";
	#} elsif ($percent < 60) {
	        #print "#FFF600\n";
        #} elsif ($percent < 85) {
		#print "#A8FF00\n";
	}

	if ($percent < 5) {
		exit(33);
	}
}

exit(0);
