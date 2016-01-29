(*
	Will Hauber
	Homework 2
	01/28/16
*)

use "hw2provided.sml";

fun all_except_option(searchString : string, stringList : string list) =
	case stringList of
		[] => NONE
	  | first::rest =>
			if 
				same_string(searchString, first)
			then 
				SOME rest
			else 
				case all_except_option(searchString, rest) of
					NONE => NONE
				  | SOME rest2 => SOME (first::rest2)
				  
fun all_except_option_force_value(searchString : string, stringList : string list) =
	case all_except_option(searchString, stringList) of
		NONE => []
	  | SOME value => value
				  
fun get_substitutions1(substitutions : string list list, s : string) =
	case substitutions of
		[] => []
	  | first::rest =>
			all_except_option_force_value(s, first) @ get_substitutions1(rest, s)
