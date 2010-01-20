package Any::Image::Driver::Image::Magick;
use strict;
use warnings;

use parent 'Any::Image::Driver';

use Image::Magick;

sub load {
    my ( $self, $file ) = @_;

    my $img = Image::Magick->new;
    $img->Read($file);

    $self->{img} = $img;
}

sub width {
    $_[0]->{img}->Get('Width');
}
sub height {
    $_[0]->{img}->Get('Height');
}

sub resize {
    my ($self, $width, $height ) = @_;

    $self->{img}->Resize(width => $width, height => $height);
}

sub save {
    my ($self, $file) = @_;

    $self->{img}->Write($file);
}


1;
