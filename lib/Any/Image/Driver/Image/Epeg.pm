package Any::Image::Driver::Image::Epeg;
use strict;
use warnings;

use parent 'Any::Image::Driver';

use Image::Epeg 0.09 qw(:constants);

sub load {
    my ( $self, $file ) = @_;

    my $img = Image::Epeg->new($file);

    $self->{img} = $img;
}

sub img {
    my $self = shift;

    if ( @_ ) {
        $self->{img} = $_[0];
    }

    $self->{img};
}

sub width {
    $_[0]->{img}->get_output_width;
}
sub height {
    $_[0]->{img}->get_output_height;
}

sub resize {
    my ($self, $width, $height ) = @_;

    $self->{img}->resize($width, $height);
}

sub save {
    my ($self, $file) = @_;

    $self->{img}->write_file($file);
}

sub clone {
    my $self = shift;

    my $data = $self->{img}->get_data;
    $self->img(Image::Epeg->new(\$data));

    my $new_img = (ref $self)->new;
    $new_img->img(Image::Epeg->new(\$data));
    return $new_img;
}


1;
