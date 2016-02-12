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

