type new_person_t = {
    name: string;
    blood: string;
}

(* let count_A: new_person_t -> int *)
let count_A rcd = match rcd with
  {name = n; blood =b} -> b = "A"

let filter_count_A lst = List.length(List.filter count_A lst)

let data1 = {name = "okabe1"; blood = "A"}
let data2 = {name = "okabe2"; blood = "B"}
let data3 = {name = "okabe3"; blood = "O"}
let data4 = {name = "okabe4"; blood = "AB"}
let data5 = {name = "okabe5"; blood = "A"}

let test1 = filter_count_A [] = 0
let test2 = filter_count_A [data1] = 1
let test3 = filter_count_A [data1; data2] = 1
let test4 = filter_count_A [data1; data5; data1; data3; data4] = 3

(* use 局所関数定義 *)
let new_filter_count_A lst =
  let count_A rcd = match rcd with
    {name = n; blood = b} -> b = "A" in
      List.length(List.filter count_A lst)

let test1 = new_filter_count_A [] = 0
let test2 = new_filter_count_A [data1] = 1
let test3 = new_filter_count_A [data1; data2] = 1
let test4 = new_filter_count_A [data1; data5; data1; data3; data4] = 3

let new_filter_count_A lst =
  List.length(List.filter (fun rcd -> match rcd with
      {name =n; blood =b} -> b = "A") lst)

let test1 = new_filter_count_A [] = 0
let test2 = new_filter_count_A [data1] = 1
let test3 = new_filter_count_A [data1; data2] = 1
let test4 = new_filter_count_A [data1; data5; data1; data3; data4] = 3


(*
#use "14_2.ml";;
*)