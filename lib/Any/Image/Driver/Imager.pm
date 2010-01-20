package Any::Image::Driver::Imager;
use strict;
use warnings;

use parent 'Any::Image::Driver';

use Imager;

sub load {
    my ( $self, $file ) = @_;

    my $img = Imager->new(file => $file);

    $self->{img} = $img;
}

sub width {
    $_[0]->{img}->getwidth;
}
sub height {
    $_[0]->{img}->getheight;
}

sub resize {
    my ($self, $width, $height ) = @_;

    $self->{img} = $self->{img}->scale(
        xpixels => $width,
        ypixels => $height,
        type    => 'nonprop',
    );
}

sub save {
    my ($self, $file) = @_;

    $self->{img}->write(file => $file);
}


1;
