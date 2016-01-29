(*val x = 3;
val str = case x of
    1 => "one"
    | 2 => "two"
    | 3 => "three";
    
    
datatype colors = WHITE | RED | GREEN | BLUE | BLACK;
datatype amColors = WHITE | BLACK;

val colorWhite = WHITE;
val colorWhite2 = WHITE;
    
    *
    
fun convertToSuit(suitNum : int) = 
    let
        datatype suits = Spades | Hearts | Diamonds | Clubs;
    in
        case suitNum of
            1 => "Spades"
          | 2 => "Hearts"
          | 3 => "Diamonds"
          | 4 => "Clubs"
          | _ => "Unknown"
    end
    
val s = convertToSuit(1);
val h = convertToSuit(2);
val d = convertToSuit(3);
val c = convertToSuit(4);
val u = convertToSuit(5);

*)
    
datatype suits = Spades | Hearts | Diamonds | Clubs;

datatype cards = FlavorA of (int * suits) | FlavorB of (int * string);

fun convertToString(suit : suits) =
    case suit of
        Spades => "Spades"
      | Hearts => "Hearts"
      | Diamonds => "Diamonds"
      | Clubs => "Clubs"
    
(*
val s = convertToString(Spades);
val h = convertToString(Hearts);
val d = convertToString(Diamonds);
val c = convertToString(Clubs);
*)

fun convertToFlavorB(card : cards) =
    case card of
        FlavorB => card
      | FlavorA => FlavorB(#1 card, convertToString(#2 card))
        
val 3S = convertToFlavorB((3, Spades));
val 4D = convertToFlavorB((3, "Diamonds"));

(*
datatype collection = Single : int
                    | Double : int * int
                    | Multiple : int * collection;*)
        
    