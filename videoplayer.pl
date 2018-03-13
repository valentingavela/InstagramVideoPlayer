#!/usr/bin/perl
#Selecciona un video random del directorio

my $pth = "/home/pi/materiales/instagram/" ;

my @files = <"/home/cliff/Downloads/*.mp4">;
my $item = $files[rand(@files)];
system("omxplayer $item");
