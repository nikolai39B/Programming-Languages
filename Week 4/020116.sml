(*fun double x = 2 * x;
fun incr x = x + 1;
val a_tuple = (double, incr, double(incr 7));*)

fun subSort (order : (int * int) -> bool, listToSort : int list) =
    case listToSort of
        first::second::tail =>
            if order(first, second)
            then first::subSort(order, second::tail)
            else second::subSort(order, first::tail)
      | _ => listToSort

fun sort(order : (int * int) -> bool, listToSort : int list) =
    case listToSort of
        [] => []
      | _ =>
            case subSort(order, listToSort) of
                head::tail =>
                    head::sort(order, tail) 
        
fun myOrder(first : int, second : int) =
    first <= second
    
val res = sort(myOrder, [4, 5, 18, 6, 9, 0]);

(*fun test(x : int, y : int) =
    x > 5 andalso y < 9
    
fun runFunc(func : (int * int) -> bool, x : int, y : int) =
    func(x, y)
    
val res = runFunc(test, 6, 10);*)
    