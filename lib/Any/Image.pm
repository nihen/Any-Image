package Any::Image;
use strict;
use warnings;
our $VERSION = '0.01';

use UNIVERSAL::require;

our $GUESS_DRIVERS = [qw/Image::Imlib2 Imager Image::Magick Image::Epeg GD/];

sub _guess_driver_class {
    my $file = shift;
    my $args = shift;

    if ( $args->{driver} ) {
        my $driver = 'Any::Image::Driver::' . $args->{driver};
        $driver->require;
        return $driver;
    }
    else {
        foreach my $_driver ( @{$GUESS_DRIVERS} ) {
            my $driver = 'Any::Image::Driver::' . $_driver;
            return $driver if $driver->require;
        }
    }
}

sub load {
    my $class = shift;
    my $file  = shift;
    my $args  = shift || {};

    my $driver_class = _guess_driver_class($file, $args)
        or die("driver not found");

    my $img = $driver_class->new();
    $img->load($file);

    return $img;
}

1;
__END__

=head1 NAME

Any::Image -

=head1 SYNOPSIS

  use Any::Image;

  my $img = Any::Image->load('hoge.jpg');
  $img->resize(100, 100);
  $img->width;
  $img->height;
  $img->save('huga.jpg');

=head1 DESCRIPTION

Any::Image is

=head1 AUTHOR

Masahiro Chiba E<lt>nihen@megabbs.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
