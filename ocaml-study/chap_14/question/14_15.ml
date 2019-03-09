(* enumerate: int -> int list *)
let rec enumerate num =
  if num = 0 then
    []
  else
    num :: enumerate (num - 1)

let one_to_n num =
  List.fold_right (+) (enumerate num) 0

let test1 = one_to_n 0 = 0
let test2 = one_to_n 2 = 3
let test3 = one_to_n 4 = 10
let test4 = one_to_n 10 = 55


(*
#use "14_15.ml";;
*)