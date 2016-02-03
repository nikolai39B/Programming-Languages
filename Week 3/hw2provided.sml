(* CS 4003, HW2 Provided Code *)

(*
	Will Hauber
	Homework 2 Solution
	01/28/16
*)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
   
fun same_string(s1 : string, s2 : string) =
    s1 = s2

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

(* you may assume that Num is always used with values 2, 3, ..., 9
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove
exception NotInList

fun card_color(currentCard : card) =
	case currentCard of
		(Clubs, r) => Black
	  | (Spades, r) => Black
	  | (Diamonds, r) => Red
	  | (Hearts, r) => Red
	  
fun card_value(currentCard : card) =
	case currentCard of
		(s, Num(value)) => value
	  | (s, Jack) => 10
	  | (s, Queen) => 10
	  | (s, King) => 10
	  | (s, Ace) => 11
	  
fun remove_card(cs : card list, c : card, e : exn) =
	case cs of
		(* If we hit the end, we didn't find our card, so throw the exception. *)
		[] => raise e
		(* Peel of the head value. *)
	  | head::tail =>
			(* If it's our card... *)
			if head = c
			(* ...then return the rest of the cards. *)
			then tail
			(* Otherwise, recurse on the tail and prepend the current card. *)
			else head::remove_card(tail, c, e)
	
fun all_same_color(cards: card list) =
	case cards of
		(* If there's no cards, should we return true or false? Assumed true. *)
		[] => true
		(* Get the color for the first card in the list. *)
	  | first::rest =>
			(* Store this color and compare to it all other cards. *)
			let
				val cardColor = card_color(first)
			in
				let 
					fun cardsAreColor(cardsToCheck : card list, requiredColor : color) =
						case cardsToCheck of
							(* If we're out of cards, then all cards were the required color. *)
							[] => true
							(* Otherwise, check the next card. *)
						  | head::tail =>
								(* If this card is the required color... *)
								if card_color(head) = requiredColor
								(* ...we're good so far. Check the rest. *)
								then cardsAreColor(tail, requiredColor)
								(* Otherwise, we've failed so return false. *)
								else false
				in
					(* Call our local helper to solve the problem. *)
					cardsAreColor(rest, cardColor)
				end
			end
							 
fun sum_cards(cards : card list) =
	let
		fun getSum(cs : card list, accSum : int) =
			case cs of
				(* If we're out of cards, return the accumulation. *)
				[] => accSum
				(* Otherwise, add to the accumulation and recurse on the rest of the cards. *)
			  | head::tail => getSum(tail, accSum + card_value(head))
	in
		(* Call our local helper with default values. *)
		getSum(cards, 0)
	end
	
fun score(heldCards : card list, goal : int) =
	let
		(* Get the sum of the held cards. *)
		val sumHeldCards = sum_cards(heldCards)
	in
		let
			(* Get the preliminary score. *)
			val preliminaryScore =
				if sumHeldCards > goal
				then 3 * (sumHeldCards - goal)
				else goal - sumHeldCards
		in
			(* Divide by 2 if all cards are the same color. *)
			if all_same_color(heldCards)
			then preliminaryScore div 2
			else preliminaryScore
		end
	end
	
fun officiate(cardList : card list, playerMoves : move list, goal : int) =
	let
		fun runGame(playerHand : card list, remainingCards : card list, remainingMoves : move list, goal : int) =
			(* If there are no more moves... *)
			if remainingMoves = []
			(* ...the game is over, so return the score. *)
			then score(playerHand, goal)
			(* Otherwise, keep checking conditions. *)
			else
				case remainingMoves of
					(* If the next move is a discard, then discard that card and recurse to do the next move. *)
					Discard(headCard)::restOfMoves =>
						runGame(remove_card(playerHand, headCard, IllegalMove), remainingCards, restOfMoves, goal)
					(* Otherwise, draw a card. *)
				  | Draw::restOfMoves =>
						case remainingCards of
							(* If there are no more cards, the game is over, so return the score. *)
							[] => score(playerHand, goal)
							(* Otherwise, draw a card and add it to the player hand. *)
						  | headCard::restOfCards =>
							let
								(* Update the player hand so that we can check it. *)
								val newPlayerHand = headCard::playerHand
							in
								(* If the sum of the player cards exceeds the goal... *)
								if sum_cards(newPlayerHand) > goal
								(* ...the game is over, so return the score. *)
								then score(newPlayerHand, goal)
								(* Otherwise, recurse to do the next move. *)
								else runGame(newPlayerHand, restOfCards, restOfMoves, goal)
							end
	in
		(* Run the game. *)
		runGame([], cardList, playerMoves, goal)
	end
							
			
			