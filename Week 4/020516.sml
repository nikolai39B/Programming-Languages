fun something(z) =
    z + 5;

fun doSomething(myFun) =
    let
        val y = 10
    in
        myFun(y)
    end
    
fun callDoSomething() =
    doSomething(fn x => x + 5)
    
val res = callDoSomething();