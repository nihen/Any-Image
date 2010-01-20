package Any::Image::Driver;
use strict;
use warnings;

sub new {
    my $class = shift;

    bless {} => $class;
}

sub img {
    my $self = shift;

    if ( @_ ) {
        $self->{img} = $_[0];
    }
    $self->{img};
}

sub clone {
    my $self = shift;
    
    my $img = (ref $self)->new;
    $img->img($self->_clone_img);
    return $img;
}

1;
