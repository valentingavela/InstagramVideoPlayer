#!/usr/bin/perl
#Selecciona un video random del directorio
my @files = <"/home/pi/materiales/instagram/*.mp4">;
my $item = $files[rand(@files)];
system("omxplayer -p -o hdmi $pth$item");
