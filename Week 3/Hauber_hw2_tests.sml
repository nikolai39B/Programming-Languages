(*
	Will Hauber
	Homework 2 Tests
	01/28/16
*)

use "hw2providedTests.sml";
use "hw2provided.sml";

val test1				= "all_except_option";
val empty_1				= all_except_option("a", []) = NONE;
val basic1_1			= all_except_option("a", ["b", "a", "c"]) = SOME ["b", "c"];
val basic2_1			= all_except_option("b", ["b", "a", "c"]) = SOME ["a", "c"];
val missing_1			= all_except_option("d", ["b", "a", "c"]) = NONE;

val test2				= "get_substitutions1";
val empty_2				= get_substitutions1([[]], "a") = [];
val example1_2			= get_substitutions1([["Fred", "Fredrick"], ["Elizabeth", "Betty"], 
                            ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"];
val example2_2          = get_substitutions1([["Fred", "Fredrick"], ["Jeff", "Jeffrey"], 
                            ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"];
val basic1_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "a") = ["b", "c"];
val basic2_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "b") = ["a"];
val basic3_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "c") = ["a", "d", "e"];
val basic4_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "d") = ["c", "e"];
val missing_2			= get_substitutions1([["a", "b"], ["a", "c"], ["c", "d", "e"]], "f") = [];

val test3               = "get_substitutions2";
val empty_3				= get_substitutions2([[]], "a") = [];
val example1_3			= get_substitutions2([["Fred", "Fredrick"], ["Elizabeth", "Betty"], 
                            ["Freddie", "Fred", "F"]], "Fred") = ["Fredrick", "Freddie", "F"];
val example2_3          = get_substitutions2([["Fred", "Fredrick"], ["Jeff", "Jeffrey"], 
                            ["Geoff", "Jeff", "Jeffrey"]], "Jeff") = ["Jeffrey", "Geoff", "Jeffrey"];
val basic1_3			= get_substitutions2([["a", "b"], ["a", "c"], ["c", "d", "e"]], "a") = ["b", "c"];
val basic2_3			= get_substitutions2([["a", "b"], ["a", "c"], ["c", "d", "e"]], "b") = ["a"];
val basic3_3			= get_substitutions2([["a", "b"], ["a", "c"], ["c", "d", "e"]], "c") = ["a", "d", "e"];
val basic4_3			= get_substitutions2([["a", "b"], ["a", "c"], ["c", "d", "e"]], "d") = ["c", "e"];
val missing_3			= get_substitutions2([["a", "b"], ["a", "c"], ["c", "d", "e"]], "f") = [];

val test4               = "similar_names";
val example_4           = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], 
                            {first="Fred", middle="W", last="Smith"}) = 
                            [{first="Fred", last="Smith", middle="W"}, 
                             {first="Fredrick", last="Smith", middle="W"},
                             {first="Freddie", last="Smith", middle="W"},
                             {first="F", last="Smith", middle="W"}];
val basic1_4			= similar_names([["a", "b"], ["a", "c"], ["c", "d", "e"]],
							{first="a", middle="y", last="z"}) = 
							[{first="a", middle="y", last="z"},
							 {first="b", middle="y", last="z"},
							 {first="c", middle="y", last="z"}];
val basic2_4			= similar_names([["a", "b"], ["a", "c"], ["c", "d", "e"]], 
							{first="c", middle="y", last="z"}) = 
							[{first="c", middle="y", last="z"},
							 {first="a", middle="y", last="z"},
							 {first="d", middle="y", last="z"},
							 {first="e", middle="y", last="z"}];
val missing_4			= similar_names([["a", "b"], ["a", "c"], ["c", "d", "e"]],
							{first="f", middle="y", last="z"}) = 
							[{first="f", middle="y", last="z"}];
							
val test5				= "card_color";
val clubs_5				= card_color(Clubs, Jack) = Black;
val spades_5			= card_color(Spades, Ace) = Black;
val hearts_5			= card_color(Hearts, Num(2)) = Red;
val diamonds_5			= card_color(Diamonds, Num(9)) = Red;

val test6				= "card_value";
val two_5				= card_value(Clubs, Num(2)) = 2;
val five_5				= card_value(Spades, Num(5)) = 5;
val nine_5				= card_value(Diamonds, Num(9)) = 9;
val jack_5				= card_value(Hearts, Jack) = 10;
val queen_5				= card_value(Hearts, Queen) = 10;
val king_5				= card_value(Hearts, King) = 10;
val ace_5				= card_value(Hearts, Ace) = 11;

val test7				= "remove_card";
						(* Using [(Clubs, Ace)] just so that there's no chance of overlap (by using [] for example). *)
val empty_7				= (remove_card([], (Clubs, Num(2)), NotInList) 
							handle NotInList => [(Clubs, Ace)]) = [(Clubs, Ace)];
val basic1_7			= remove_card([(Clubs, Num(2))], (Clubs, Num(2)), NotInList) = [];
val basic2_7			= remove_card([(Clubs, Num(2)), (Clubs, Num(2))], (Clubs, Num(2)), NotInList) = [(Clubs, Num(2))];
val basic3_7			= remove_card([(Hearts, Num(8)), (Spades, Ace)], (Spades, Ace), NotInList) = [(Hearts, Num(8))];
val basic4_7			= remove_card([(Hearts, Num(8)), (Hearts, Num(6)), (Hearts, Num(4)), (Spades, Ace)], (Spades, Ace), NotInList) = 
							[(Hearts, Num(8)), (Hearts, Num(6)), (Hearts, Num(4))];
val notInList_7			= (remove_card([(Clubs, Num(2)), (Clubs, Num(2))], (Clubs, Num(5)), NotInList) 
							handle NotInList => [(Clubs, Ace)]) = [(Clubs, Ace)];
							
val test8				= "all_same_color";
val empty_8				= all_same_color([]) = true;
val basic1_8			= all_same_color([(Clubs, Jack)]) = true;
val basic2_8			= all_same_color([(Clubs, Jack), (Clubs, Ace)]) = true;
val basic3_8			= all_same_color([(Clubs, Jack), (Clubs, Ace), (Spades, King)]) = true;
val basic4_8			= all_same_color([(Clubs, Jack), (Hearts, Ace), (Spades, King)]) = false;
val basic5_8			= all_same_color([(Diamonds, Jack), (Hearts, Ace), (Spades, King)]) = false;
val basic6_8			= all_same_color([(Diamonds, Jack), (Hearts, Ace), (Diamonds, King)]) = true;

val test9				= "sum_cards";
val empty_9				= sum_cards([]) = 0;
val basic1_9			= sum_cards([(Clubs, Jack)]) = 10;
val basic2_9			= sum_cards([(Clubs, Num(4))]) = 4;
val basic3_9			= sum_cards([(Clubs, Num(5)), (Clubs, Queen), (Hearts, Ace)]) = 26;

val test10				= "score";
val empty1_9			= score([], 0) = 0;
val empty2_9			= score([], 5) = 2;
val basic1_9			= score([(Clubs, Jack)], 5) = ((10 - 5) * 3) div 2;
val basic2_9			= score([(Clubs, Jack)], 15) = (10 - 5) div 2;
val complex1_9			= score([(Diamonds, Jack), (Hearts, Ace), (Spades, Num(4))], 25) = 0;
val complex2_9			= score([(Diamonds, Jack), (Hearts, Ace), (Spades, Num(4))], 31) = 31 - 25;
val complex3_9			= score([(Diamonds, Jack), (Hearts, Ace), (Spades, Num(4))], 10) = (25 - 10) * 3;
val complex4_9			= score([(Diamonds, Jack), (Hearts, Ace), (Hearts, Num(4))], 10) = ((25 - 10) * 3) div 2;

val test11				= "officiate";
						(* This is a copy of provided_test1(). For some reason the exception wasn't being handles properly if I
						   just call the function itself, but this way it works. *)
val provided1_11		=
						(let 
							val cards = [(Clubs,Jack),(Spades,Num(8))]
							val moves = [Draw,Discard(Hearts,Jack)]
						in
							officiate(cards,moves,42) 
						end 
							handle IllegalMove => 99999) = 99999;
val provided2_11		= provided_test2() = 3;

