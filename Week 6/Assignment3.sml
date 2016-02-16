(*Written By William Hauber and Matthew McClellan*)
use "utility.sml";

fun multiples (n, m) =
  map(fn x => x*m, 1--n)

(*
fun multiples(n, m) =
  map(fn (x, y) => 
*)

fun sumTo (n) = 
  
  if n=1 then 1.0
  else reduce(fn (x, y) => x + y, [ 1.0/real(n) ] @ [ sumTo(n-1) ])

fun numNegative (argumentList) =
  if null argumentList then 0 
  else  reduce (fn (x, y) => x + y, map (fn x => if x < 0 then 1 else 0, argumentList))

(*
fun allPairs (m, n) =
  let fun recursivelyPlot (acc, remainingFirstList, remainingSecondList, origSecondList) =
		      case remainingFirstList of [] => acc 
					      |  head::rest => case remainingSecondList
									of [] => recursivelyPlot(acc, rest, origSecondList, origSecondList)
									|  innerHead::innerRest => recursivelyPlot((head, innerHead)::acc, head::rest, innerRest, origSecondList)
  in qsort(fn (x,y) => if (#1 x) < (#1 y) then true else if (#1 x) = (#1 y) andalso (#2 x) < (#2 y) then true else false, recursivelyPlot([], 1--m, 1--n, 1--n ))
  end

*)

fun allPairs (m, n) =
    reduce ( fn (x,y) => x @ y,  map ( fn x => map(fn y => (x,y), 1--n), 1--m ) )

	 

