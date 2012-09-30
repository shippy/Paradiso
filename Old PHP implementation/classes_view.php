<?php
// classes for display and view

class HTMLPage {
	public $title, $css, $enc, $author;
	
	function __construct($title, $css = null, $enc = "UTF-8") {
		$this->title = $title;
		$this->css = $css;
		$this->enc = $enc;
	}
	
	function printHeader($strict = false) {
	  $doctype[true] = '<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">';
    $doctype[false] = '<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
	  echo $doctype[$strict].'<html>
	  <head>
	    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	    <title>'.$this->title.'</title>
	    ';
	  $link_str = "\r\n".'	        <link rel="stylesheet" media="%s" href="%s" />';
	  if (!is_null($this->css)) {
	    if (is_array($this->css)) {
	      foreach ($this->css as $media => $source) {
	        printf($link_str, $media, $source);
	      }
	    } else {
	      printf($link_str, "screen", $this->css);
	    }
	  }
	  echo "    </head>
	  <body><div id=\"main\">
	    <h1>{$this->title}</h1>";
	}
	
	function printEnd() {
	  echo '  </div></body></html>';
	}
}
