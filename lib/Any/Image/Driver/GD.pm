package Any::Image::Driver::GD;
use strict;
use warnings;

use parent 'Any::Image::Driver';

use GD;

sub load {
    my ( $self, $file ) = @_;

    my $img = GD::Image->new($file);

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

    my $old_img = $self->{img};
    my $new_img = GD::Image->new($width, $height);

    $new_img->copyResampled(
        $self->{img},
        0, 0, 0, 0,
        $width, $height,
        $old_img->width, $old_img->height
    );

    $self->{img} = $new_img;
}

sub save {
    my ($self, $file) = @_;

    open my $wfh, '>', $file;
    print {$wfh} $self->{img}->jpeg; # TODO: guess output type from filename
    close $wfh;
}

sub _clone_img {
    $_[0]->{img}->clone;
}

1;
