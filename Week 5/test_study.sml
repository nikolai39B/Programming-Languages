(*
val myRecord = { first = 1, second = "2nd", third = 2.0 + 1.0 };
val myRecordThird = #third myRecord;

datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp
             
fun eval(e) =
    case e of
        Constant i => i
      | Negate e1 => eval(e1)
      | Add (e1, e2) => eval(e1) + eval(e2)
      | Multiply (e1, e2) => eval(e1) * eval(e2)
      
val res = eval(Add(Constant(~3), Multiply(Constant(3), Constant(5))));
*

fun doNTimes(func, n, x) =
    if 
        n = 0
    then
        x
    else
        doNTimes(func, n - 1, func(x))
        
fun tripleX(x) =
    x * 3
        
val res1 = doNTimes(tripleX, 4, 1);

fun addAChar(str) =
    str ^ "a"
    
val strRes = doNTimes(addAChar, 8, "edcb");

val res2 = doNTimes((fn x => x * x), 4, 2);
*

fun map(func, xs) =
    case xs of 
        [] =>
            []
      | head::tail =>
            func(head)::map(func, tail)
            
            
val res = map(fn x => x - 3, [1, 2, 5, 9, 12, 23]);
*
val x = 1;

fun f(y) = 
    x + y;
    
val x = 2;
val y = 3;
val z = f(x + y);
*

val x = 1

fun f(y) =
    let
        val x = y+1
    in
        fn z => x + y + z
    end
    
val x = 3
val g = f(4) * fn z => 9 + z *
val y = 5
val z = g(6) * 15 *
*

fun fold (f, acc, xs) =
    case xs of
        [] => 
            acc
      | x::xs => 
            fold (f, f(acc, x), xs)
            
val res = fold(fn (x, y) => x + y, 0, [ 1, 2, 3, 4, 5 ]);
*)

signature MATHLIB =
    sig
        val fact : int -> int
        val doubler : int -> int
    end


structure MyMathLib :> MATHLIB =
    struct
        fun fact x =
            if 
                x = 0
            then 
                1
            else 
                x * fact(x - 1)
                
        val half_pi = Math.pi / 2.0
        
        fun doubler x = 
            x * 2
    end
