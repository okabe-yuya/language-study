(* count_length: a list -> int *)
let rec count_length lst = match lst with
  [] -> 0
  | first :: rest -> 1 + count_length rest

let test6 = count_length [] = 0
let test7 = count_length [1] = 1
let test8 = count_length [1; 3; 3; 2] = 4

(* equal_length: a list, a list -> bool *)
let rec equal_length lst1 lst2 = match (lst1, lst2) with
  ([], []) -> true
  | ([], first :: rest) -> false
  | (first :: rest, []) -> false
  | (first1 :: rest1, first2 :: rest2) ->
    if count_length lst1 = count_length lst2 then
      true
    else
      false


let test1 = equal_length [] [] = true
let test2 = equal_length [1] [] = false
let test3 = equal_length [] [1] = false
let test4 = equal_length [1] [1] = true
let test5 = equal_length [2; 3] [2; 5] = true
let test = equal_length [1] [2; 3] = false

(*
#use "equal_length.ml";;
*)