use Device::Velleman::K8055 qw(:all);
use Test::More tests => 1;
use strict;
use warnings;
print STDERR "Please press the digital input buttons 1 to 5, one at the time\n\n";
ok(digital_input_test() == 1, "Analog Led Test");

sub digital_input_test
{
    die "Can't open K8055 device" unless OpenDevice(0) == 0;
    my ($input1,$input2,$input3,$input4,$input5) = (0,0,0,0,0);
    do
    {
        my $value = ReadAllDigital();
        if ($value & 0x01) { $input1 = 1; print "button 1 pressed\n"}
        elsif($value & 0x02) {$input2 = 1; print "button 2 pressed\n"}
        elsif($value & 0x04) {$input3 = 1; print "button 3 pressed\n"}
        elsif($value & 0x08) {$input4 = 1; print "button 4 pressed\n"}
        elsif($value & 0x10) {$input5 = 1; print "button 5 pressed\n"}
    } until ($input1 && $input2 && $input3 && $input4 && $input5);

    CloseDevice();
    return 1;
}