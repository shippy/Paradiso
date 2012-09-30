<?php
include 'classes_trades.php';
include 'classes_view.php';
$page = new HTMLPage('Code test');
$page->printHeader();


######### Testing
// Getting some random names
$names = preg_split("/[\s]+/", "Jacob 	Isabella
Ethan 	Sophia
Michael 	Emma
Jayden 	Olivia
William 	Ava
Alexander 	Emily
Noah 	Abigail
Daniel 	Madison
Aiden 	Chloe
Anthony 	Mia");

// Getting Lit teachers
$lit = array(
  "Jane Levin" => "TTh 9:00-10:15",
  "Edwin Duval" => "MW 2:30-3:45",
  "Stefanie Markovits" => "TTh 2:30-3:45",
  "Angela Capodivacca" => "TTh 2:30-3:45",
  "Pericles Lewis" => "MW 9:00-10:15",
  "Pauline Leven" => "MW 9:00-10:15",
  "Timothy Robinson" => "TTh 2:30-3:45");

// creating sections
foreach ($lit as $teacher => $time) {
  $sections[LIT][] = new Section($teacher, $time, LIT);
}

// generating traders with names, random current section, random desired sections
for($i = 1; $i < 10; $i++) {
  $current_key = rand(0, count($sections[LIT]) - 1);
  $current = array($sections[LIT][$current_key]);
  $desired_keys = array_rand($sections[LIT], rand(1, 4));
  $desired_keys = is_array($desired_keys) ? $desired_keys : array($desired_keys);
  while (in_array($current_key, $desired_keys)) {
    $desired_keys[array_search($current_key, $desired_keys)] = array_rand($sections[LIT]);
  }
  foreach ($desired_keys as $key) {
    $desired[] = $sections[LIT][$key];
  }
  
  $traders[] = new Trader($i,
    $names[rand(0, count($names)-1)]." ".chr(rand(65, 90)),
    $current,
    $desired);
  unset($desired);
}

$tb = new TradingBoard($traders);

$i = 0;
foreach ($traders as $trader) {
  $results[$i++] = $tb->getTrades($trader);
#  if (empty($results[$i - 1])) echo "\n No match found for {$trader->name}.";
}

echo "<h1>Trades filtered</h1>";
echo var_dump($results);
foreach ($results as $trades) {
  
  foreach ($trades as $trade) {
    if ($trade) echo "<pre>{$trade->display()}</pre>";
  }
}

echo "<h1>Trades unfiltered</h1>";/*
foreach ($possibleTrades as $tradeSet) {
  array_map(create_function('$x', 'printf("<pre>%s</pre>", $x->display());'), $tradeSet);
}*/
foreach ($tb->possibleTrades as $trade) {
  if ($trade) echo "<pre>{$trade->display()}</pre>";
}

$page->printEnd();
?>
