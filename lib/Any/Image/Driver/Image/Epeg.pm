package Any::Image::Driver::Image::Epeg;
use strict;
use warnings;

use parent 'Any::Image::Driver';

use Image::Epeg qw(:constants);

sub load {
    my ( $self, $file ) = @_;

    my $img = Image::Epeg->new($file);

    $self->{img} = $img;

    # resize後のサイズをget_widthとかで取得できないので
    # とりあえずこのAny::Image::Driver::Epeg側でもっておく。
    # 外から$img->{img}->resizeとかされたときは追跡できないので注意
    $self->{width}  = $img->get_width;
    $self->{height} = $img->get_height;
}

sub width {
    $_[0]->{width};
}
sub height {
    $_[0]->{height};
}

sub resize {
    my ($self, $width, $height ) = @_;

    $self->{img}->resize($width, $height);
    $self->{width}  = $width;
    $self->{height} = $height;
}

sub save {
    my ($self, $file) = @_;

    $self->{img}->write_file($file);
}


1;
