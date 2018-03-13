#!/usr/lib/perl
use LWP::Simple ;
use strict ;
use warnings ;
use JSON ;

# my $authorize = "https://api.instagram.com/oauth/authorize/?client_id=ce5473096d55448e8eb83df00f08a19a&redirect_uri=http://www.muta.com.ar&response_type=token" ;

my $pthdownload = "/home/pi/materiales/instagram/" ;
my $userid = "3660484819" ; #userid de instagram
my $access_token="3660484819.ce54730.fe52f24234b24c4998219a39da480be4" ; #access_token que se consigue con la app registrada
my $url = "https://api.instagram.com/v1/users/$userid/media/recent/?access_token=$access_token" ; #url para extraer imagen y video

my $random = int(rand(1000000)) ;

my $jsondata = getJsonFromUrl($url) ;

foreach my $rec (@{$jsondata->{data}})
{
  my $videourl = $rec->{videos}{standard_resolution}{url} ;
  (my $name) = $videourl =~ m!([^/]+)$!;

  if(!-e "$pthdownload$name")
  {
    getstore($videourl, "/tmp/$name") ;
    # system("mv /tmp/$name $pthdownload$name") ;
    system("mv /tmp/$name $name") ;
  }
  last ;
}

#################################
sub getJsonFromUrl
{
my $url = shift ;
my $json_data = get($url);
my $json_obj = new JSON;
my $perl_data = $json_obj->decode($json_data);
return $perl_data ;
}