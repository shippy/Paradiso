<?php
// classes to do with users, user rights and privileges
class User {
	public $netid;
	public $name;
	public $email;
	public $id;
	
	function __construct ($netid, $name, $email) {
		$this->netid = $netid;
		$this->name = $name;
		$this->email = $email;
	}
	
	function get_name() {
		return $this->name;
	}
	
	function get_netid() {
		return $this->netid;
	}
	
	function get_email() {
		return $this->email;
	}
}

class Student extends User {
	public $current = array("H" => 0, "L" => 0, "P" => 0);
	public $demand = array("H" => 0, "L" => 0, "P" => 0);
	
	public $dropped = false;
	public $id;
	
	function __construct($netid, $id, $name, $email, $current, $demand, $dropped) {
		$this->netid = $netid;
		$this->id = $id;
		$this->name = $name;
		$this->email = $email;
		$this->current = $current;
		$this->demand = $demand;
		$this->dropped = $dropped;
	}
	
	function drop() {
		$this->dropped = true;
		
		$cmd = "UPDATE students
		SET dropped = TRUE, desired_lit = 0, desired_hist = 0, desired_p = 0
		WHERE id = ".$this->id;
		
		mysqli::query($cmd);
	}
	
	// check if the $sections variable has correct form - an array containing a permissible key and integer value
	function sections_input_valid($sections) {
		$allowed = array("H", "L", "P");
		$keys = array_keys($sections);
		foreach ($keys as $k) {
			if (!in_array($k, $allowed)) return false;
		}
		
		$values = array_values($sections);
		foreach ($values as $i) {
			if (!is_int($i)) {
			  return false;
			}
		}
	}
	
	function set_demand($sections) {
		if ($this->sections_input_valid($sections)) {
			return false;
		} else {
			
		}
	}
	
	function set_current($sections) {
		if ($this->sections_input_valid($sections)) {
			return false;
		} else {
			
		}
	}

	function findTrades() {
    
	}
}

class Admin extends User {
	// $students is an array of objects
	
}
