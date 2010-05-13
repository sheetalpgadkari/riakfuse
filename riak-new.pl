#!/usr/bin/perl;


use strict;
use warnings;

use lib '.';
use RiakFuse;


use Getopt::Long;

my $fsname;
my $server;
my $clean = 0;
my $mountpoint;
my $trace = 0;
my $debug = 0;
GetOptions("clean"     => \$clean,
	   "server=s"  => \$server,
	   "fsname=s"  => \$fsname,
	   "mount=s"   => \$mountpoint,
	   "trace=i"   => \$trace,  
	   "debug=i"   => \$debug,  
    );

die "Please tell me what server I should be using (--server=127.0.0.1:8091)\n" unless $server;
die "Please tell me the name of the filesystem (--fsname=mytestfs) (maps to a bucket)\n" unless $fsname;
die "Please tell me where to mount it (--mount=/tmp/myfs) (where to mount)\n" unless $mountpoint;

RiakFuse::conf(
    mountpoint => "/tmp/foo",
    trace => $trace,
    debug => $debug,
    threaded => 1,
    bufferdir => "/tmp/buffer",
    filebucket => "$fsname",
    logbucket => "filesystem1_log",
    server => "http://$server/",
    );




