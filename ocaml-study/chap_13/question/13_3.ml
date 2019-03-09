(* 'a -> 'a *)
let func1 str = str

(* 'a -> 'b -> 'a *)
let func2 func str = func

(* 'a -> 'b -> 'b *)
let func3 func str = str

(* 'a -> ('a -> 'b) -> 'b *)
let func4 str func = func str

(* ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c *)
let func5 func_a func_b value = func_b (func_a value)

(*
#use "13_3.ml";;
*)