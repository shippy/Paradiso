<?php
$siteURL = "http://shippy.nazory.cz/paradiso/";
$loginURL = $siteURL."login.php";

$ticket = $_GET['ticket'];
if ($ticket) {
	session_start();
	$url = "https://secure.its.yale.edu/cas/serviceValidate?service=".urlencode($loginURL)."&ticket=".$ticket;
	$content = file_get_contents($url);
	
	// Code by Jan Kolmas
	$trim_middle = strstr($content, '<cas:user>');
	$trim_start = substr($trim_middle,10);

	$patch=explode("<",substr($trim_start,0,8));
	$netid=$patch[0];
	// End-code
	
	$_SESSION['netid'] = $netid;
	header('Location: '.$siteURL,'?sid='.session_id());
} else {
	header('https://secure.its.yale.edu/cas/serviceValidate?service='.urlencode($loginURL));
}

/*
Ahoj,

nejprve das nekam odkaz na CAS login

https://secure.its.yale.edu/cas/login?service=http%3A%2F%2Fbluebooker.net%2Flogin.php

To te presmeruje na CAS a pak na stranku uvedenou jako service. Skrz GET ti to posle ticket.

pro validaci ticketu jdes na secure.its.yale.edu/cas/serviceValidate

napriklad (login.php):

$ticket = $_GET['ticket'];
$url = "https://secure.its.yale.edu/cas/serviceValidate?service=http%3A%2F%2Fbluebooker.net%2Flogin.php&ticket=".$ticket;
$content = file_get_contents($url);

pro vydolovani netID z XML co ti to vrati muzes pouzit muj kod:

$trim_middle = strstr($content, '<cas:user>');
   $trim_start = substr($trim_middle,10);

   $patch=explode("<",substr($trim_start,0,8));
   $netid=$patch[0];

no a pro odhlaseni proste jdes sem:

https://secure.its.yale.edu/cas/logout


Honza
*/
