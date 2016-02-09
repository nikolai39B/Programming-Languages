val x = ref 42;
val y = ref 42;
val z = x;
val k = x := 43;
val w = (!y) + (!z);