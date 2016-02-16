(* CS 4003, HW2 Provided Tests *)

use "Assignment3.sml";

fun numNegative_test1 () =
  if numNegative([~3, ~3, 1]) = 2
  then true
  else false

fun numNegative_test2 ()=
  if numNegative([~3, 3, 1]) = 1
  then true
  else false

fun numNegative_test3 () =
  if numNegative([3, 3, 1]) = 0
  then true
  else false

fun numNegative_test4 () =
  if numNegative([]) = 0
  then true
  else false


fun allPairs_test1 () =
  if allPairs(2, 2) = [(1,1), (1,2), (2,1), (2,2)]
  then true
  else false
	   
fun allPairs_test2 () =
  if allPairs(3, 2) = [(1,1), (1,2), (2,1), (2,2), (3,1), (3,2)]
  then true
  else false
	   
	   
fun testIt (funcName : string, funcBool) =
  print ( funcName ^ ": " ^ Bool.toString( funcBool ) );

fun runTests () =
  testIt("numNegative_test1", numNegative_test1());
  testIt("numNegative_test2", numNegative_test2());
  testIt("numNegative_test3", numNegative_test3());
  testIt("numNegative_test4", numNegative_test4());
  testIt("allPairs_test1", allPairs_test1());
  testIt("allPairs_test2", allPairs_test2());


(*--- Execution ---*)
runTests()
