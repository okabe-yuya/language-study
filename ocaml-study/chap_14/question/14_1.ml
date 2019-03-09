let even n = n mod 2 = 0

let filter_even lst = List.filter even lst

let test1 = filter_even [] = []
let test2 = filter_even [1] = []
let test3 = filter_even [2] = [2]
let test4 = filter_even [1; 2; 3; 4] = [2; 4]

(* use 局所関数定義 *)
let new_filter_even lst =
  let even num = num mod 2 = 0 in
    List.filter even lst

let test1 = new_filter_even [] = []
let test2 = new_filter_even [1] = []
let test3 = new_filter_even [2] = [2]
let test4 = new_filter_even [1; 2; 3; 4] = [2; 4]

(* use 無名関数 *)
let new_filter_even lst =
  List.filter (fun num -> num mod 2 = 0) lst

let test1 = new_filter_even [] = []
let test2 = new_filter_even [1] = []
let test3 = new_filter_even [2] = [2]
let test4 = new_filter_even [1; 2; 3; 4] = [2; 4]


(*
#use "14_1.ml";;
*)