(*
    Assignment 3 Tests
    
    Authors: Matthew McClellan and Will Hauber
    Date: 02/16/16
*)

use "mcclellan_hauber_hw3.sml";

val test1               = "multiples";
val basic1_1            = multiples(3, 5) = [ 5, 10, 15 ];
val basic2_1            = multiples(1, 4) = [ 4 ];
val negative_1          = multiples(4, ~3) = [ ~3, ~6, ~9, ~12 ];

val test2               = "sumTo";
val basic1_2            = let val res = sumTo(2); val e = 0.001; val exp = 1.5 in res < exp + e andalso res > exp - e end;
val basic2_2            = let val res = sumTo(3); val e = 0.001; val exp = 1.8333333 in res < exp + e andalso res > exp - e end;

val test3               = "numNegative";
val given1_3            = numNegative([~3, ~3, 1]) = 2;
val given2_3            = numNegative([~3, 3, 1]) = 1;
val given3_3            = numNegative([3, 3, 1]) = 0;
val given4_3            = numNegative([]) = 0;
val allNegative_3       = numNegative([~3, ~3, ~1]) = 3;

val test4               = "allPairs";
val given1_4            = allPairs(2, 2) = [(1, 1), (1, 2), (2, 1), (2, 2)];
val given2_4            = allPairs(3, 2) = [(1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2)];
val basic1_4            = allPairs(1, 1) = [(1, 1)];
val basic2_4            = allPairs(1, 3) = [(1, 1), (1, 2), (1, 3)];

val test5               = "capitals_only";
val empty_5             = capitals_only([]) = [];
val basic1_5            = capitals_only([ "hi", "Hello", "whats_up", "Heyo" ]) = [ "Hello", "Heyo" ];
val basic2_5            = capitals_only([ "hi", "Hello", "whats_up", "heyo" ]) = [ "Hello" ];
val none_5              = capitals_only([ "hi", "hello", "whats_up", "heyo" ]) = [];
val all_5               = capitals_only([ "Hi", "Hello", "Whats_up", "Heyo" ]) = [ "Hi", "Hello", "Whats_up", "Heyo" ];
	   