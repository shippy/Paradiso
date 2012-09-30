<?php

define("LIT", "Literature");
define("PHIL", "Philosophy");
define("HP", "History & Politics");

class TradingBoard {
  public $traders, $possibleTrades;

  function __construct($traders = false) {
    // obtain all people willing to trade, or dropping
    // indicate pending trades?

    if ($traders) {
      $this->traders = $traders;
    } else {
      // load from DB
    }
  }

  static function commit($md5, $id) {
    // try to obtain from db table trades_pending a record with the same md5 and id
    // if successful, commit the change
    // - update current section, remove it from preferences
    // - e-mail both students with confirmation
    // if unsuccessful, alert the initiator that
  }

  static function ask_approval() {
    // expand arguments
    if (func_num_args() > 0) {
      $trades = array();
      foreach (func_get_args() as $trade) {
        $trades[] = $trade;
      }
    } else return false;  
    
    $blurbs = array_map(
                create_function('$x', 'return "\n".$x->display();'),
                $trades);
    
    // get admin e-mails, names
		$msg = sprintf("Dear %s,\n\n Paradiso has confirmed that students are interested in the following section trades: %s.",
		        $admin->name,
		        $blurbs); 
	  // create unique transaction code and transaction ID
    $md5 = md5(json_encode($trades));
    # $id must be taken from database - ++greatestID
	  // save trade into trades_pending with common transaction ID, md5
	}

	function displayTraders() {

	}

	function statistics() {

	}

	function newSearch($seeker) {
	  foreach ($this->traders as $id => $trader) {
	    if ($trader != $seeker) $this->traders[$id]->tapped = false;
	  }
	}

	function tap() {
	  $args = func_get_args();
	  foreach ($this->traders as $id => $trader) {
	    if (empty($args)) break;
	    if (in_array($trader, $args)) {
	      $this->traders[$id]->tapped = true;
	      unset($args[array_search($trader, $args)]);
	    }
	  }
	}

  function getTrades($seeker) {
    // get simple pairs
#    $results = array_merge($this->findPairs($seeker), $this->findPolygons($seeker));
#    // get complex pairs
#    $results = !empty($results) ? array_merge($results, $this->findPolygons($seeker)) : $this->findPolygons($seeker);
    // eliminate duplicities - merge
#    echo var_dump($results);
#    return removeDuplicities($results);
    $array1 = $this->findPairs($seeker);
    $array2 = $this->findPolygons($seeker);
    sort($array1);
    sort($array2);
    sort($this->possibleTrades);
    return array_merge($array1, $array2);
  }

  function getAllTrades() {
    
    
  }

	function findPairs($seeker) {
	  $traders =& $this->traders;
    $return = array();
    foreach ($traders as $trader) {
      foreach ($seeker->current as $curr) {
        if (in_array($curr, $trader->desired)) {
          foreach ($seeker->desired as $des) {
            if (in_array($des, $trader->current)) {
              $return[] = new Trade(
                new Transfer($seeker, $curr, $des), 
                new Transfer($trader, $des, $curr));
            }
          }
        }
      }
    }
    $this->possibleTrades = array_merge($this->possibleTrades, $return);
    return $return;
  }

  function findPolygons($seeker, $depth = false) { // To-do -- add argument for course part (Lit, ...)
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

    $traders =& $this->traders;
  	
    if (!$depth) {
      $this->newSearch($seeker);
      $superinit = $seeker->current[0];
    } else {
      $superinit = $depth->getInit();
    } // superinit is the original initializer

    
    $init = $seeker->current[0]; // this will have to change when all three will have to be evaluated
    $finds = $seeker->desired;
    
    // pick those traders whose Inits are among seeker's Finds
    foreach ($finds as $find) {
      foreach ($traders as $trader) {
        if ($seeker == $trader) {
          continue;
        }
        
        if (in_array($find, $trader->current)) {
          if (in_array($superinit, $trader->desired)) {
            // We hit the jackpot!

            $hit = new Transfer($seeker, $init, $find);
            $ret = new Transfer($trader, $find, $superinit);
            
            if ($depth) $depth->add($hit, $ret);
            else $depth = new Trade($hit, $ret);
            
            $this->possibleTrades[] = $depth;
            return $depth;
          } elseif ($trader->tapped == true) {
            // Running in circles -> terminating!
            $depth = false;
            return array();
  #          break;
          } else {
            // Going further in...
            $hit = new Transfer($seeker, $init, $find);
            $this->tap($seeker, $trader);
            if ($depth) $depth->add($hit); else $depth = new Trade($hit); 
            return $this->findPolygons($trader, $depth);
          }
        }
      }
    }
  }
}
function removeDuplicities ($list, $prev = array()) {
  if (count($list) == 0) return $prev;
  $curr = $list[0];
  if (!in_array(array_shift($list), $prev)) $prev[] = $curr;
  removeDuplicities($list, $prev);
}


class Section {
  public $teacher;
  public $days;
  public $time;
  public $course;
  public $students;

  function __construct ($teacher, $time, $course) {
    if (!in_array($course, array(LIT, PHIL, HP))) {
      return false;
    } else $this->course = $course;

    $this->teacher = $teacher;
    $this->time = $time;
  }

  function addstudent($student) {
    
  }

  function replaceStudent($incoming, $outgoing) {
    
  }
}

include 'classes_sorting.php';

class Trader extends Student {
  public $id, $netid; // number
  public $name;
  public $current; // section instances
  public $desired = array(); // array of Section instances
  public $dropped = false;

  public $tapped = false; // variable for depth-first searching - upon cycling through, turn true

  function __construct($id, $name, $current, $desired) {
    $this->id = $id;
    $this->name = $name;
    foreach ($current as $section) {
      if (!is_a($section, 'Section')) return false;
    }
    foreach ($desired as $section) {
      if (!is_a($section, 'Section')) return false;
    }
    $this->current = $current;
    $this->desired = $desired;
  }

  function drop($bool) {
    $this->dropped = (boolean)$bool;
  }
}

class Trade {
  // trade consists of a closed loop of Transfers (transfer_1->outgoing == transfer_n->incoming).
  public $transfers = array();
  
  function __construct() {
    $args = func_get_args();
    foreach ($args as $transfer) {
      if (is_a($transfer, 'Transfer')) $this->transfers[] = $transfer;
    }
  }

  function add($transfer) {
    $args = func_get_args();
    foreach ($args as $transfer) {
      if (is_a($transfer, 'Transfer')) $this->transfers[] = $transfer;
    }
  }

  function display() {
    $header = "Displaying the trade transfers (".count($this->transfers)."):\n";
    $content = '';
    foreach ($this->transfers as $transfer) {
      $content .= $transfer->display();
    }
    return $header.$content;
  }

  function getInit() {
    return $this->transfers[0]->initSection;
  }
}

class Transfer {
  public $person, $initSection, $newSection;

  function __construct($person, $initSection, $newSection) {
    $this->person = $person;
    $this->newSection = $newSection;
    $this->initSection = $initSection;
  }

  public function display() {
    return sprintf("%s wishes to transfer from <b>%s's</b> to <b>%s's</b> section, which meets on %s.\n",
    $this->person->name,
    $this->initSection->teacher,
    $this->newSection->teacher,
    $this->newSection->time).
    sprintf("   <small style='font-style: italics; '>She could also transfer to one of %s.</small>\n",
    join(" or ", array_map(create_function('$x', 'return $x->teacher;'), $this->person->desired))
    );
  }
}

#function findTrade($seeker, $traders) {
#  $return = array();
#  foreach ($traders as $trader) {
#    foreach ($seeker->current as $curr) {
#      if (in_array($curr, $trader->desired)) {
#        foreach ($seeker->desired as $des) {
#          if (in_array($des, $trader->current)) {
#            $return[] = new Trade(
#              new Transfer($seeker, $curr, $des), 
#              new Transfer($trader, $des, $curr));
#          }
#        }
#      }
#    }
#  }
#  return empty($return) ? false : $return;
#}

$possibleTrades = array();
function findTrades ($seeker, $traders, $depth = false) { // To-do -- add argument for course part (Lit, ...)
  global $tb; // TradingBoard
  global $possibleTrades;
  
  // this fn should be embedded in a class - both arguments should be class variables
  // depth is an array that passes on subsequent trades

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
  if (!$depth) {
    $tb->newSearch($seeker);
    $superinit = $seeker->current[0];
  } else {
    $superinit = $depth->getInit();
  } // superinit is the original initializer

  
  $init = $seeker->current[0]; // this will have to change when all three will have to be evaluated
  $finds = $seeker->desired;
  
  // pick those traders whose Inits are among seeker's Finds
  foreach ($finds as $find) {
    foreach ($traders as $trader) {
      if ($seeker == $trader) {
        continue;
      }
      
      if (in_array($find, $trader->current)) {
        if (in_array($superinit, $trader->desired)) {
          // We hit the jackpot!

          $hit = new Transfer($seeker, $init, $find);
          $ret = new Transfer($trader, $find, $superinit);
          
          if ($depth) $depth->add($hit, $ret);
          else $depth = new Trade($hit, $ret);
          
          $possibleTrades[] = $depth;
          return $depth;
        } elseif ($trader->tapped == true) {
          // Running in circles -> terminating!
          unset($depth);
          return false;
#          break;
        } else {
          // Going further in...
          $hit = new Transfer($seeker, $init, $find);
          $tb->tap($seeker, $trader);
          if ($depth) $depth->add($hit); else $depth = new Trade($hit); 
          return findTrades($trader, $traders, $depth);
        }
      }
    }
  }
}

?>
