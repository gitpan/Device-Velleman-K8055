use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Device::Velleman::K8055',
    AUTHOR              => 'Jouke <jouke@pvoice.org>',
    VERSION_FROM        => 'lib\Device\Velleman\K8055.pm',
    ABSTRACT_FROM       => 'lib\Device\Velleman\K8055.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Win32::API' => 0.40,
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Device-Velleman-K8055-*' },
);

print <<NOTIFICATION;
# 
# This module is a simple wrapper around the K8055D.DLL that 
# Velleman supplies with the K8055 USB kit. Therefore you need
# to copy this DLL in a directory in your path (e.g. C:\\WINDOWS)
# The DLL can be found inside this package.
# 
NOTIFICATION
