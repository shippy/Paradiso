<?php
include './classes.php';

/*
// CAS login - if ticket, continue; if not, redirect to login

if (!$_SESSION['netid']) { // Is the user logged in?
  $siteURL = "http://shippy.nazory.cz/paradiso/";
  $loginURL = $siteURL."login.php";
  header('https://secure.its.yale.edu/cas/serviceValidate?service='.urlencode($loginURL));
} elseif (!$_SESSION['name']) { // Is he freshly redirected from login site, or are userdata loaded?
  $cmd = "SELECT students.*, users.* FROM students, users WHERE netid = $netid";
  $data = $db->query($cmd); // loaded in classes.php
  
  // Establish authorization
  $authorizations = array('Student', 'Teacher', 'Admin');
  
  // Create serializable object (Student, Teacher, Admin)
  
  
  // Assign other data
} // Move all this into classes? Or maybe check.php to include in every script?

*/

