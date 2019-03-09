(* sum_list: int list -> int list *)
let sum_list lst =
  let rec accumulator lst total = match lst with
    [] -> []
    | first :: rest ->  first + total ::  accumulator rest (first + total) in
      accumulator lst 0

let data1 = [1; 2; 3; 4]
let data2 = [5; 5; 5; 5; 5; 5]

let test1 = sum_list [] = []
let test2 = sum_list [1] = [1]
let test3 = sum_list [1; 2] = [1; 3]
let test4 = sum_list data1 = [1; 3; 6; 10]
let test5 = sum_list data2 = [5; 10; 15; 20; 25; 30]

(*
#use "16_1.ml";;
*)