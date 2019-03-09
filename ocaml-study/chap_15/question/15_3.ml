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

let rec make_list num =
  if num < 2 then
    []
  else
    num :: make_list (num-1)

(* sieve: int list -> int list *)
let rec sieve lst =
  let judger num lst = List.filter(fun x -> x mod num > 0) lst in
    match lst with
      [] -> []
      | first :: rest -> first :: sieve (judger first rest)

(* prime: int -> int list *)
let prime num =
  let num_list = make_list num in
    let sorted_list = new_quick_sort num_list in
      sieve sorted_list


let test1 = sieve [] = []
let test2 = sieve [2] = [2]
let test3 = sieve [2; 3; 4] = [2; 3]
let test4 = sieve [2; 3; 4; 5; 6; 7; 8; 9] = [2; 3; 5; 7]

let test1 = prime 0 = []
let test2 = prime 2 = [2]
let test3 = prime 4 = [2; 3]
let test4 = prime 9 = [2; 3; 5; 7]

(*
#use "15_3.ml";;
*)