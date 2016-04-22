fun testFun(a, b, c) =
    if
        a
    then
        b
    else
        c 

fun fibo(n) =
    if
        n <= 0
    then
        0
    else if 
        n = 1 
    then
            1
    else
        fibo(n - 1) + fibo(n - 2)
        
fun fastFibo(n) =
    let
        fun aux(iter, lastVal, currVal, numIters) =
            if
                iter = numIters
            then
                lastVal
            else
                aux(iter + 1, currVal, lastVal + currVal, numIters)
    in
        aux(0, 0, 1, n)
    end
    
fun testFibos(max) = 
    let
        fun aux(iter, numIters) =
            (
                print(Int.toString(iter) ^ ": ");
                print(Int.toString(fibo(iter)) ^ " - ");
                print(Int.toString(fastFibo(iter)) ^ "\n");
                if
                    iter >= numIters
                then
                    null
                else
                    aux(iter + 1, numIters)
            )
    in
        aux(0, max)
    end
    
datatype expression = constant of int
                    | negative of expression
                    | add of (expression * expression)
                    | multiply of (expression * expression)
                 
                 
fun evalExpression(expr) = 
    case expr of
        constant(x)
            => x
      | negative(x)
            => ~1 * evalExpression(x)
      | add(x1, x2)
            => evalExpression(x1) + evalExpression(x2)
      | multiply(x1, x2)
            => evalExpression(x1) * evalExpression(x2)
            
fun printList(listToPrint) = 
    case listToPrint of
        []
            => 
            (
                print("\n");
                true
            )
      | first :: rest
            => 
            (
                print(Int.toString(first) ^ " ");
                printList(rest)
            )
            
signature MATH_LIBRARY =
    sig
        val factorial : int -> int
        val double : int -> int
        val degreesToRadians : real -> real
        (* val halfPi : real *)
    end
           
structure MathLibrary :> MATH_LIBRARY =
    struct
        fun factorial(x) =
            if x < 1
            then
                0
            else if x = 1
            then
                1
            else
                x * factorial(x - 1)

        fun double(x) = 
            x + x
         
        val halfPi = Math.pi / 2.0       
            
        fun degreesToRadians(x) =
            x * halfPi / 90.0
    end