(*
	Will Hauber
	Homework 2
	01/28/16
*)

use "hw2provided.sml";

fun all_except_option(searchString : string, stringList : string list) =
	case stringList of
		(* If we're out of strings to search, return NONE. *)
		[] => NONE
		(* Otherwise, peel of the first value in the list of strings to search. *)
	  | first::rest =>
			if 
				(* If this string matches our given string... *)
				same_string(searchString, first)
			then
				(* ...return the rest of the strings. The earlier strings will be prepended during recursion. *)
				SOME rest
			else
				(* Otherwise, recurse on the rest of the strings. *)
				case all_except_option(searchString, rest) of
					(* If we get NONE out of this call, keep passing it down. *)
					NONE => NONE
					(* Otherwise, return the result, but with this call's 'first' prepended. *)
				  | SOME rest2 => SOME (first::rest2)
				  
fun get_substitutions1(substitutions : string list list, s : string) =
	case substitutions of
		(* If we are out of substitution possiblilites to look at, return []. *)
		[] => []
		(* Otherwise, peel off the first list of substitions. *)
	  | first::rest =>
			(* Get all of the possible substitutions for 's' from this current list. *)
			case all_except_option(s, first) of
				(* If there are no substitions, then recurse on the rest of the lists. *)
                NONE => get_substitutions1(rest, s)
				(* Otherwise, still recurse on the rest of the lists, but prepend the substitions to the result. *)
              | SOME value => value @ get_substitutions1(rest, s)
              
              
fun get_substitutions2(substitutions : string list list, s : string) =
    let
		(* Let 'acc' be our accumulated result value. *)
		fun aux(subs : string list list, str : string, acc : string list) =
			case subs of
				(* If we are out of substitution possiblilites to look at, return the current accumulation. *)
				[] => acc
				(* Otherwise, peel off the first list of substitions. *)
			  | first::rest =>
					case all_except_option(str, first) of
						(* If there are no substitions, then recurse on the rest of the lists and don't change our acc. *)
						NONE => aux(rest, str, acc)
						(* Otherwise, still recurse on the rest of the lists, but modify acc to hold the substitions. *)
					  | SOME value => aux(rest, str, acc @ value)
	in
		(* Call our aux function with the default values. *)
		aux(substitutions, s, [])
	end
				
fun similar_names(substitions : string list list, fullName : {first : string, middle : string, last : string }) =
	case fullName of
		(* Peel off the first name. *)
		{first = f, middle = _, last = _} =>
			let
				(* Get the list of possible substitions. *)				
				val possibleSubstituions = get_substitutions1(substitions, f)
			in
				let 
					(* Define the local helper to build the list of fullName instances to return. *)
					fun buildFullNameInstances(subs : string list, fullName : {first : string, middle : string, last : string }) =
						case subs of
							(* If we're out of subs, then return empty. *)
							[] => []
							(* Otherwise, peel of the first value *)
						  | head::tail =>
								case fullName of
									(* Peel off the middle and last name. *)
									{first = _, middle = m, last = l} =>
										(* Build the current fullName instance, and recurse. *)
										{first = head, middle = m, last = l}::buildFullNameInstances(tail, fullName)
				in
					(* Call our local helper to build the list of fullName instances. Also prepend the given fullName. *)
					fullName::buildFullNameInstances(possibleSubstituions, fullName)
				end
			end
				