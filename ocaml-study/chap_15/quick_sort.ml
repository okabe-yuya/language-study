(* quick_sort: int list -> int list *)
let rec quick_sort lst =
  let make_less_list num rest_lst = List.filter(fun x -> x < num) rest_lst in
    let make_greater_list num rest_lst = List.filter(fun x -> x >= num) rest_lst in
      match lst with
        [] -> []
        | first :: rest ->
          make_less_list first (quick_sort rest)
          @ [first]
          @ make_greater_list first (quick_sort rest)

(* use ordinal function *)
let rec new_quick_sort lst =
  let base_lst_func num rest_lst judge = List.filter(fun x -> judge num x) rest_lst in
    let make_less_list num rest = base_lst_func num rest (>) in
      let make_greater_list num rest = base_lst_func num rest (<=) in
        match lst with
          [] -> []
          | first :: rest ->
            make_less_list first (new_quick_sort rest)
            @ [first]
            @ make_greater_list first (new_quick_sort rest)


(* test for quick_sort *)
let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [3; 4; 1] = [1; 3; 4]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]

(* 同じ数字がある時にquick_sortでは該当値が消えてしまう *)
let test6 = quick_sort [1; 2; 2; 5; 6]

(* test for new_quick_sort *)
let test7 = new_quick_sort [] = []
let test8 = new_quick_sort [1] = [1]
let test9 = new_quick_sort [1; 2] = [1; 2]
let test10 = new_quick_sort [3; 4; 1] = [1; 3; 4]
let test11 = new_quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]


(* let make_less_list num rest_lst = List.filter(fun x -> x < num) rest_lst
let make_greater_list num rest_lst = List.filter(fun x -> x > num) rest_lst
let test12 = make_less_list 1 [2; 2; 5; 6]
let test13 = make_greater_list 1 [2; 2; 5; 6]
let test14 = test12 @ [1] @ test13 *)

(*
#use "quick_sort.ml";;
*)