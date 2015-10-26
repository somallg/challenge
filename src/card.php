<?php
 $cards = array("ah", "ac", "ad", "as",
               "2h", "2c", "2d", "2s",
               "3h", "3c", "3d", "3s",
               "4h", "4c", "4d", "4s",
               "5h", "5c", "5d", "5s",
               "6h", "6c", "6d", "6s",
               "7h", "7c", "7d", "7s",
               "8h", "8c", "8d", "8s",
               "9h", "9c", "9d", "9s",
               "th", "tc", "td", "ts",
               "jh", "jc", "jd", "js",
               "qh", "qc", "qd", "qs",
               "kh", "kc", "kd", "ks");
srand(time());
 for($i = 0; $i < 52; $i++) {
    $count = count($cards);
    $random = (rand()%$count);
        if($cards[$random] = "") {
            $i--;
        }
        else {
            $deck[] = $cards[$random];
            $cards[$random] = "";
        }
 }
 srand(time());
 $starting_point = (rand()%51);
 print("<p>Starting point for cut cards is: $starting_point</p>");
 for ($index = 0; $index < 52; $index++) 
    if ($starting_point == 52) { $starting_point = 0; 
    print("Uncut Point: <b>$deck[$index]</b>");
    print("Starting Point: <b>$deck[$starting_point]</b><br />");
    $starting_point++;
 }
 ?>
