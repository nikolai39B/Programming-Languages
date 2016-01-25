(*
fun factorial(x : int) =
    if (x <= 1)
    then 1
    else x * factorial(x - 1)
    
fun testFactorial(x : int) = 
    if (x < 0) 
    then 0
    else (
        val ans = factorial(x);
        testFactorial(x - 1)
    )
 

val zero = factorial(0);
val one = factorial(1);
val two = factorial(2);
val three = factorial(3);
val four = factorial(4);
val five = factorial(5);


val res = testFactorial(10);
*

fun is_older (day1 : int, month1 : int, year1 : int, day2 : int, month2 : int, year2 : int) =
    if (year1 > year2)
    then false
    else if (year1 < year2)
    then true
    else if (month1 > month2)
    then false
    else if (month1 < month2)
    then true
    else if (day1 > day2)
    then false
    else if (day2 < day2)
    then true
    else false
    
val res1 = is_older(21, 1, 2016, 22, 1, 2016);
val res2 = is_older(16, 2, 2015, 16, 1, 2015);
val res3 = is_older(1, 1, 2000, 1, 1, 2001);
*

fun swap (pr : int*bool) = 
    (#2 pr, #1 pr)
   

val test = (12, true);
val res = swap(test);
val res2 = swap(32, false);
val res3 = swap((32, false));
swap((32, false));
*

val x1 = (7, (true, 9));
val x2 = #1 (#2 x1);
val x3 = (#2 x1);
val x4 = ((3, 5), ((4, 8), (0, 0)));
*

val e1 = 4;
val e2 = [5, 6, 7, 8];
val e3 = e1::e2;
*

val e1 = 5;
val e2 = 8;
val e3 = e1::e2;
*

fun countdown (x : int) =
    if x=0
    then []
    else x :: countdown(x-1)
    
val x = countdown(27);
*)

fun sum_pair_list (xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl(xs))
    
val res = sum_pair_list[(5, 6), (7, 8), (9, 0)];

