fun better_max (xs : int list) =
    if null xs
    then NONE
    else
        let val t1_ans = better_max(tl xs)
        in
            if isSome t1_ans
                andalso valOf t1_ans > hd xs
            then t1_ans
            else SOME (hd xs)
        end
        
val max = valOf(better_max([1, 2, 3]));

