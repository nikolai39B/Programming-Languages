use "exam_review_methods.sml";

fun map(listToMap, func) =
    case listToMap of
        [] =>
            []
      | head::tail =>
            func(head)::map(tail, func)
            
val test3 = length([1, 2, 3]) = length([1, 2, 3]);
            
fun combineLists(list1, list2, combiningFunc) =
    let
        val listsEqual = length(list1) = length(list2)
    in
    if listsEqual
        then
            case list1 of
                [] =>
                    []
              | head1::tail1 =>
                    let
                        val head2 = hd(list2)
                        val tail2 = tl(list2)
                    in
                        combiningFunc(head1, head2)::combineLists(tail1, tail2, combiningFunc)
                    end
        else
            []
    end
        
        
val test1 = 1 = 3;
val test2 = 4 = 4;
    
val res1 = map([1, 2, 3, 4, 5, 6], fn x => x + 4);
val res2 = combineLists(
    [1, 2, 3, 4, 5],
    [10, 2, ~6, 0, 1],
    fn (x, y) => (x * y + 1));