let is_mod3_1 n = n mod 3 = 1
let is_positive n = n > 0

let rec filter func lst = match lst with
  [] -> []
  | first :: rest ->
    if func first then
      first :: filter func rest
    else
      filter func rest


let filter_is_mod2 lst = filter is_mod3_1 lst
let filter_is_positive lst = filter is_positive lst

let test1 = filter_is_mod2 [] = []
let test2 = filter_is_mod2 [1] = [1]
let test3 = filter_is_mod2 [1; 3; 4; 5; 6; 7] = [1; 4; 7]
let test4 = filter_is_positive [] = []
let test5 = filter_is_positive [1] = [1]
let test6 = filter_is_positive [-1; 3; 0; 3; 4; -5] = [3; 3; 4]

(*
#use "filter.ml";;
*)