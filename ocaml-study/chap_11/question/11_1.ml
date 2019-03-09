(* sum_of_square: int -> int *)
let rec sum_of_square num =
  if num = 0 then
    0
  else
    num * num + sum_of_square (num - 1)

let test1 = sum_of_square 0 = 0
let test2 = sum_of_square 1 = 1
let test3 = sum_of_square 3 = 0 + 1 + 4 + 9
let test4 = sum_of_square 5 = 0 + 1 + 4 + 9 + 16 + 25

(*
#use "11_1.ml";;
*)