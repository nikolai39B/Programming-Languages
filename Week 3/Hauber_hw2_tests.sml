(*
	Will Hauber
	Homework 2 Tests
	01/28/16
*)

(*use "hw2providedTests.sml";*)
use "Hauber_hw2.sml";

val test1				= "all_except_option";
val empty_1				= all_except_option("a", []) = NONE;
val basic1_1			= all_except_option("a", ["b", "a", "c"]) = SOME ["b", "c"];
val basic2_1			= all_except_option("b", ["b", "a", "c"]) = SOME ["a", "c"];
val missing_1			= all_except_option("d", ["b", "a", "c"]) = NONE;

val test2				= "get_substitutions1";
val empty_2				= get_substitutions1([[]], "a") = [];
val example_2			= get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = ["Fredrick","Freddie","F"];
val basic1_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "a") = ["b", "c"];
val basic2_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "b") = ["a"];
val basic3_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "c") = ["a", "d", "e"];
val basic4_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "d") = ["c", "e"];
val missing_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "f") = [];

