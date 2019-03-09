(* append: a list -> a list *)
let rec append lst1 lst2 = match lst1 with
  [] -> lst2
  | first :: rest -> first :: append rest lst2


let test1 = append [] [] = []
let test2 = append [1] [2] = [1; 2]
let test3 = append [1; 2] [] = [1; 2]
let test7 = append [] [1; 2] = [1; 2]
let test4 = append [1; 2; 3] [4; 5; 6] = [1; 2; 3; 4; 5; 6]
let test5 = append [1; 2] [2] = [1; 2; 2]
let test6 = append ["a"; "b"] ["c"] = ["a"; "b"; "c"]

(*
#use "append.ml";;
*)