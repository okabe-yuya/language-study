(* fold_right: func, 'a list, a -> func *)
let rec fold_right func lst init = match lst with
  [] -> init
  | first :: rest -> func first (fold_right func rest init)

(* add_list: int, int -> int *)
let add_list first rest_res = first + rest_res

(* use fold_right example *)
(*
let rec test1 add_list lst 0 = match lst with
  [] -> 0
  | first :: rest -> add_list first ( test1 add_list rest 0)
*)


(* add_increment: int, int -> int *)
let add_increment first rest_res = 1 + rest_res

(*
let rec fold_right add_increment lst 0 = match lst with
  [] -> 0
  | first :: rest -> add_increment first (fold_right add_increment rest 0)
*)

(* append_value: 'a, 'a list -> 'a list *)
let append_value first rest_res = first :: rest_res


let fold_right_add lst = fold_right add_list lst 0
let fold_right_increment lst = fold_right add_increment lst 0
let fold_right_append lst1 lst2 = fold_right append_value lst1 lst2

let test1 = fold_right_add [1; 2; 3] = 6
let test2 = fold_right_add [] = 0
let test3 = fold_right_add [0; 3] = 3
let test4 = fold_right_increment [] = 0
let test5 = fold_right_increment [1;1;1;1;1;1;1;1;] = 8
let test6 = fold_right_append [] [] = []
let test7 = fold_right_append [] [1] = [1]
let test8 = fold_right_append [1; 2] [1; 2] = [1; 2; 1; 2]
let test9 = fold_right_append [1; 2; 3] [4; 5; 6] = [1; 2; 3; 4; 5; 6]

(*
#use "fold_right.ml";;
*)