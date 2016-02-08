fun nTimes(f, n, x) =
    if
        n = 0
    then
        x
    else
        f(nTimes(f, n - 1, x))
        
fun triple(x) =
    3 * x
    
fun sort(listToSort, sortingFunction) =
    let
        fun runOnePass(listToSort, sortingFunction) =
            case listToSort of
                (* Two or more elements. *)
                first::second::rest =>
                    if
                        (* If first is before second... *)
                        sortingFunction(first, second)
                    then
                        (* ...prepend first and recurse on second::rest. *)
                        first::sort(second::rest, sortingFunction)
                    else
                        (* Otherwise, prepend second and recurse on first::rest. *)
                        second::sort(first::rest, sortingFunction)
                (* Exactly one more element. *)
              | last::[] =>
                    last::[]
                (* No more elements. *)
              | [] =>
                    []
                    
        fun runAllPasses(listToSort, sortingFunction, passesLeft) =
            let
                (* Run a pass and store the result. *)
                val listAfterNextPass = runOnePass(listToSort, sortingFunction)
            in
                if
                    (* If that was our last pass... *)
                    passesLeft <= 1
                then
                    (* ...simply return the result. *)
                    listAfterNextPass
                else
                    (* Otherwise, recurse to run the remaining passes. *)
                    runAllPasses(listAfterNextPass, sortingFunction, passesLeft - 1)
            end
    in
        runAllPasses(listToSort, sortingFunction, length listToSort)
    end
        
val res = nTimes(triple, 12, 3);

val sortedList = sort([ 3, 15, 2, 7, ~8, 9 ], fn (x, y) => x < y);

val x = 1;
fun f(y) = 
    x + y
val x = 2;
val y = 3;
val z = f(x + y);

val x = 1;
fun f(y) =
    let
        val x = y + 1
    in
        fn z => x + y + z
    end
val x = 3;
val g = f(4);
val y = 5;
val z = g(6);