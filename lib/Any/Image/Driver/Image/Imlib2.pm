package Any::Image::Driver::Image::Imlib2;
use strict;
use warnings;

use parent 'Any::Image::Driver';

use Image::Imlib2;

sub load {
    my ( $self, $file ) = @_;

    my $img = Image::Imlib2->load($file);

    $self->{img} = $img;
}

sub width {
    $_[0]->{img}->width;
}
sub height {
    $_[0]->{img}->height;
}

sub resize {
    my ($self, $width, $height ) = @_;

    $self->{img} = $self->{img}->create_scaled_image($width, $height);
}

sub save {
    my ($self, $file) = @_;

    $self->{img}->save($file);
}

sub _clone_img {
    $_[0]->{img}->clone;
}


1;
