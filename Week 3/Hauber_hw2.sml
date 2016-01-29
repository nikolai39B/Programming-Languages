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
			case all_except_option(s, first) of
                NONE => get_substitutions1(rest, s)
              | SOME value => value @ get_substitutions1(rest, s)
              
              
fun get_substitutions2(substitutions : string list list, s : string) =
    []
    
fun substitute_names(candidates : string list, fullName : {first : string, middle : string, last : string }) =
    case candidates of
        [] => []
      | head::tail =>
            case fullName of
                {first = _, middle = m, last = l} => {first = head, middle = m, last = l}::substitute_names(tail, fullName)
                

fun similar_names(substitutions : string list list, fullName : {first : string, middle : string, last : string }) =
    case substitutions of
        [] => [ fullName ]
      | head::tail =>
            case fullName of
                {first = f, middle = _, last = _} =>
                    similar_names(tail, fullName) @ substitute_names(all_except_option_force_value(f, head), fullName)
            
