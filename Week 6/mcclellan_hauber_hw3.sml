(*
    Assignment 3
    
    Authors: Matthew McClellan and Will Hauber
    Date: 02/16/16
*)

use "utility.sml";

fun multiples(n, m) =
    map(fn x => x * m, 1 -- n)

fun sumTo(n) =   
    if n = 1 then 1.0
    else reduce(fn (x, y) => x + y, [ 1.0 / real(n) ] @ [ sumTo(n-1) ])

fun numNegative(argumentList) =
    if null argumentList then 0 
    else  reduce(fn (x, y) => x + y, map(fn x => if x < 0 then 1 else 0, argumentList))

fun allPairs(m, n) =
    reduce(fn (x, y) => x @ y,  map(fn x => map(fn y => (x, y), 1 -- n), 1 -- m ))
    
fun capitals_only(strList) =
    filter(fn str => Char.isUpper(String.sub(str, 0)), strList)

