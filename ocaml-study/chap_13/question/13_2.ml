type person_t = {
  name: string;
  sex: bool;
  blood: string;
}

let person1 = {name = "あ"; sex = true; blood = "A"}
let person2 = {name = "い"; sex = true; blood = "B"}
let person3 = {name = "う"; sex = true; blood = "AB"}
let person4 = {name = "お"; sex = true; blood = "O"}
let person5 = {name = "か"; sex = true; blood = "O"}
let person6 = {name = "い"; sex = true; blood = "O"}
let human_data = [person1; person2; person3; person4; person1]
let human_data2 = [person6; person3; person2; person4; person1]

(* check_overlap: str list, str -> bool *)
let rec check_overlap lst str = match lst with
  [] -> false
  | ({name = n; sex = s; blood = b}) as first :: rest ->
    if n = str then
      true
    else
      check_overlap rest str

(* aggregate_name: person_t list -> str list *)
let rec aggregate_name lst = match lst with
  [] -> [];
  | ({name = n; sex = s; blood = b}) :: rest ->
    let key = check_overlap rest n in
      if key = true then
        aggregate_name rest
      else
        n :: aggregate_name rest

(* if you use map func *)
let for_map_aggregate lst = match lst with
  {name = n; sex = s; blood = b} -> n

let map_aggregate lst = List.map for_map_aggregate lst


(* test for aggregate_name *)
let test2 = aggregate_name [] = []
let test3 = aggregate_name [person1] = ["あ"]
let test4 = aggregate_name [person1; person2] = ["あ"; "い"]
let test5 = aggregate_name human_data
let test6 = aggregate_name human_data2
let test7 = aggregate_name [person1; person1; person1] = ["あ"]


(* test for map_aggregate *)
let test = map_aggregate [] = []
let test1 = map_aggregate [person1; person2; person3] = ["あ"; "い"; "う"]

(*
#use "13_2.ml";;
*)