(* compose_func:  'a func, 'b func -> 'c func *)
let add3 num = num + 3
let time2 num = num * 2

let compose_func func1 func2 =
  let tmp x = func1 (func2 x) in
    tmp

let test1 = (compose_func time2 add3) 4

(*
#use "13_4.ml";;
*)