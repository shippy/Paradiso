<?php
// Find efficient trades

include './classes.php';

// $cmd = "SELECT * FROM trades";
// $db->query($cmd);

// test out trades

/*
// sample trades
// key is current section, value is desired section
// ID is implied in numerical sorting for purposes of this exercise, but should be the MySQL internal ID
$lit_trades = array(
	array(1 => array(2, 3)),
	array(1 => array(3)),
	array(2 => array(1,5)),
	array(3 => array(6)),
	array(3 => array(5)),
	array(2 => array(0)),
	array(4 => array(0)),
	array(4 => array(4)),
	array(5 => array(3)),
	array(6 => array(2)),
	array(5 => array(1)));*/

// let's have Trade Table
// let's have Initial - the section ID in which current student SID is.
// let's have Targets - array of section IDs to which the student wants to transfer.
// cycle through Trade Table to see if any ID (Hit) in the trades table has a Target as its Head
// if not, unsuccessful
// if yes: cycle through the Hits; for each Hit, cycle through Trades again to see if *their* targets are anyone's section
	// if no, terminate cycle for a given path
	// if yes, find if any Hit is the Initial
		// if no and this is less than fifth iteration, go through the finding procedure again
		// if no and this is more than fifth iteration, terminate
		// if yes, terminate

$initial = 2;
$initialSection = current(array_keys($lit_trades[$initial])); // should not be needed
$targets = current(array_values($lit_trades[$initial]));
$targets = $targets[0];

function returnHits($targetSections, $trades) {
	$return = false;
	foreach ($trades as $id => $prefs) {
		$head = current(array_keys($prefs)); // current section of the student
		$tail = current(array_values($prefs)); // target sections of the student
		
		if (in_array($head, $targetSections)) {
			$return[] = $id;
		}
	}
	return $return; // returns false if no hits were found, array of Hit IDs if they were
	// return array subset of $trades which applies? Or just array of IDs?
}

$iteration = 0;
$t = $targets; // initially a copy of $targets, evolves
$i = array($initial); // current inspected persons

while (is_array(returnHits($t, $trades)) && !@in_array($initial, returnHits($t, $trades)) && $iteration++ < 6) { 
	foreach ($i as $agent) {
		
	}

	
}



function findTail($headID, $head, $currentTail, $table, $tradesDone = array(), $iteration = 0) {
	// how to structure tradesDone? Can the findTail function work to eliminate possibilities from the map-out?
	// After all, it returns false after 10 iterations, so maybe it can...
	$iteration += 1;
	$complete = false; // is there head-tail correspondence for any number of steps?
	
	// magic has to happen here
	
	// look up ID for which head = currentTail
	foreach ($table as $id => $prefs) {
		if (current(array_keys($prefs)) == $currentTail) {
			$newTail = current(array_values());
			// how the hell do I preserve this?
		}
	}
	
	// if newTail = head OR newTail = 0 (person drops), complete = true
		// would it be worth examining if the dropout's section can be used in further trades? Probably no reason
	// if not, run findTail with newTail, increasing iteration by one
	
	// what if there are multiple options for head = currentTail? Find a way to investigate all possible trades
	
	if (!$complete && $iteration < 10) {
		return false;
	} else {
		return findTail($headID, $head, $newTail, $table, $iteration);
	}
}

/*
function FindTrades($trades) {
	$match_complete = array();
	$match_incomplete = array();
	
	// try every combination and come up with possibilities
	foreach ($trades as $id1 => $prefs1) {
		foreach ($trades as $id2 => $prefs2) {
			if ($prefs1['curr'] == $prefs2['want'] && $prefs1['curr'] == $prefs2['want']) {
				$match_complete[] = array($id1, $id2);
			} elseif (
				
		}
	}
	
	
}*/
