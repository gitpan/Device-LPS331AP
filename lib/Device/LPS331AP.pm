package Device::LPS331AP;

# PODNAME: Device::LPS331AP
# ABSTRACT: I2C interface to LPS331AP Thermometer and Barometer using Device::SMBus
#
# This file is part of Device-LPS331AP
#
# This software is copyright (c) 2013 by Shantanu Bhadoria.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
our $VERSION = '0.001'; # VERSION

use 5.010;
use Moose;
use POSIX;

# Dependencies
use Device::LPS331AP::Altimeter;


has 'I2CBusDevicePath' => ( is => 'ro', );


has Altimeter => (
    is         => 'ro',
    isa        => 'Device::LPS331AP::Altimeter',
    lazy_build => 1,
);

sub _build_Altimeter {
    my ($self) = @_;
    my $obj =
      Device::LPS331AP::Altimeter->new(
        I2CBusDevicePath => $self->I2CBusDevicePath );
    return $obj;
}

1;

__END__

=pod

=head1 NAME

Device::LPS331AP - I2C interface to LPS331AP Thermometer and Barometer using Device::SMBus

=head1 VERSION

version 0.001

=head1 ATTRIBUTES

=head2 I2CBusDevicePath

this is the device file path for your I2CBus that the LPS331AP is connected on e.g. /dev/i2c-1
This must be provided during object creation.

=head2 Altimeter

    $self->Altimeter->enable();
    $self->Altimeter->getReading();

This is a object of [[Device::LPS331AP::Altimeter]]

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders metacpan

=head1 SUPPORT

=head2 Bugs / Feature Requests

Please report any bugs or feature requests through github at 
L<https://github.com/shantanubhadoria/device-lps331ap/issues>.
You will be notified automatically of any progress on your issue.

=head2 Source Code

This is open source software.  The code repository is available for
public review and contribution under the terms of the license.

L<https://github.com/shantanubhadoria/device-lps331ap>

  git clone git://github.com/shantanubhadoria/device-lps331ap.git

=head1 AUTHOR

Shantanu Bhadoria <shantanu at cpan dott org>

=head1 CONTRIBUTORS

=over 4

=item *

Shantanu <shantanu@cpan.org>

=item *

Shantanu Bhadoria <shantanu@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Shantanu Bhadoria.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
