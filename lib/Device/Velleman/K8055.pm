package Device::Velleman::K8055;

use warnings;
use strict;
use base 'Exporter';

our (@EXPORT_OK, %EXPORT_TAGS);

use Win32::API;
$Win32::API::DEBUG=1;
Win32::API->Import('K8055D.DLL', 'OpenDevice','I','I');
Win32::API->Import('K8055D.DLL', 'CloseDevice','','');
Win32::API->Import('K8055D.DLL', 'ReadAnalogChannel','I','I');
Win32::API->Import('K8055D.DLL', 'ReadAllAnalog','II','');
Win32::API->Import('K8055D.DLL', 'OutputAnalogChannel','II','');
Win32::API->Import('K8055D.DLL', 'OutputAllAnalog','II','');
Win32::API->Import('K8055D.DLL', 'ClearAnalogChannel','I',''); 
Win32::API->Import('K8055D.DLL', 'ClearAllAnalog','','');
Win32::API->Import('K8055D.DLL', 'SetAnalogChannel','I',''); 
Win32::API->Import('K8055D.DLL', 'SetAllAnalog','','');
Win32::API->Import('K8055D.DLL', 'WriteAllDigital','I','');
Win32::API->Import('K8055D.DLL', 'ClearDigitalChannel','I','');
Win32::API->Import('K8055D.DLL', 'ClearAllDigital','','');
Win32::API->Import('K8055D.DLL', 'SetDigitalChannel','I','');
Win32::API->Import('K8055D.DLL', 'SetAllDigital','','');
Win32::API->Import('K8055D.DLL', 'ReadDigitalChannel','I','I');
Win32::API->Import('K8055D.DLL', 'ReadAllDigital','', 'I');
Win32::API->Import('K8055D.DLL', 'ReadCounter','I','I');
Win32::API->Import('K8055D.DLL', 'ResetCounter','I','');
Win32::API->Import('K8055D.DLL', 'SetCounterDebounceTime','II','');

%EXPORT_TAGS = (all => [qw( &OpenDevice                  
                            &CloseDevice                 
                            &ReadAnalogChannel           
                            &ReadAllAnalog               
                            &OutputAnalogChannel         
                            &OutputAllAnalog             
                            &ClearAnalogChannel          
                            &ClearAllAnalog              
                            &SetAnalogChannel            
                            &SetAllAnalog                
                            &WriteAllDigital             
                            &ClearDigitalChannel         
                            &ClearAllDigital             
                            &SetDigitalChannel           
                            &SetAllDigital               
                            &ReadDigitalChannel          
                            &ReadAllDigital              
                            &ReadCounter                 
                            &ResetCounter                
                            &SetCounterDebounceTime)]);

@EXPORT_OK   = qw(  &OpenDevice                  
                    &CloseDevice                 
                    &ReadAnalogChannel           
                    &ReadAllAnalog               
                    &OutputAnalogChannel         
                    &OutputAllAnalog             
                    &ClearAnalogChannel          
                    &ClearAllAnalog              
                    &SetAnalogChannel            
                    &SetAllAnalog                
                    &WriteAllDigital             
                    &ClearDigitalChannel         
                    &ClearAllDigital             
                    &SetDigitalChannel           
                    &SetAllDigital               
                    &ReadDigitalChannel          
                    &ReadAllDigital              
                    &ReadCounter                 
                    &ResetCounter                
                    &SetCounterDebounceTime      );


our $VERSION = '0.01';

1; # End of Device::Velleman::K8055

__END__

=pod

=head1 NAME

Device::Velleman::K8055 - Communication with the Velleman K8055 USB experiment board

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Currently this module is just a Win32::API wrapper around the DLL that Velleman
supplies with the board. Since that will only work on Win32 systems, I intend
to write something myself that will be portable to other platforms...patches for
this are welcome.

    use Device::Velleman::K8055 qw(:all);

    die "Can't open K8055 device" unless OpenDevice(0) == 0;
    
    for (my $i = 0; $i < 3; $i++)
    {
        for (my $j = 1; $j < 3; $j++)
        {
            SetAnalogChannel($j);
            ClearAnalogChannel($j == 1 ? 2 : ($j -1));
            sleep(1);
        }
    }
    ClearAllAnalog();
    CloseDevice();

=head1 USAGE

=head2 OpenDevice($devicenumber);

This opens the device, indicated by $devicenumber, which can be any
value ranging from 0 to 3. The devicenumber is determined by the
jumpers you set on the board. The default setting is 0.

It returns -1 if it's unsuccessful, the devicenumber that has been opened in case of success.

=head2 CloseDevice();

This closes the device. You don't need to call CloseDevice between
switching of the different devicenumbers. Just call it at the end
of your application.

=head2 $value = ReadAnalogChannel($channel);

This reads the value from the analog channel indicated by $channel.

=head2 ReadAllAnalog($data1, $data2);

This reads the values from the two analog ports into $data1 and $data2.

=head2 OutputAnalogChannel($channel, $data);

This outputs $data to the analog channel indicated by $channel.

=head2 OutputAllAnalog($data1, $data2);

This outputs $data1 to the first analog channel, and $data2 to the
second analog channel.

=head2 ClearAnalogChannel($channel);

This clears the analog channel indicated by $channel

=head2 ClearAllAnalog();

This clears all analog channels.

=head2 SetAnalogChannel($channel);

This sets analog channel $channel.

=head2 SetAllAnalog();

This sets all analog channels.

=head2 WriteAllDigital($data);

=head2 ClearDigitalChannel($channel);

=head2 ClearAllDigital();

=head2 SetDigitalChannel($channel);

=head2 SetAllDigital();

=head2 $value = ReadDigitalChannel($channel);

=head2 $value = ReadAllDigital();

=head2 $value = ReadCounter($counternumber);

=head2 $value = ResetCounter($counternumber);

=head2 SetCounterDebounceTime($counternumber, $debouncetime);


=head1 AUTHOR

Jouke, C<< <jouke@pvoice.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-device-velleman-k8055@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Device-Velleman-K8055>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 ACKNOWLEDGEMENTS

Thanks to Yaakov and Hachi from #perl on irc.perl.org for the idea that
eventually lead to buying the K8055 USB experiment board.

=head1 COPYRIGHT & LICENSE

Copyright 2005 Jouke, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

