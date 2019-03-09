let reverse lst =
  let rec rev lst r_lst = match lst with
    [] -> r_lst
    | first :: rest -> rev rest (first :: r_lst) in
      rev lst []

let reverse_half lst =
  let rec accumulator lst r_lst = match lst with
    [] -> r_lst
    | first :: rest -> accumulator rest (first / 2 :: r_lst) in
      accumulator lst []


let test1 = reverse [] = []
let test2 = reverse [1] = [1]
let test3 = reverse [1; 3; 4; 5] = [5; 4; 3; 1]
let test3 = reverse [1; 3; 4; 5]

let test4 = reverse_half [2; 4; 6; 8]

(*
#use "progress_accumulator.ml";;
*)