type person_t = {
  name: string;
  sex: bool;
  blood: string;
}

let person1 = {name = "あ"; sex = true; blood = "A"}
let person2 = {name = "い"; sex = true; blood = "B"}
let person3 = {name = "う"; sex = true; blood = "AB"}
let person4 = {name = "え"; sex = true; blood = "O"}
let human_data = [person1; person2; person3; person4; person1]

(* count_blood: person_t list, string -> int *)
let rec count_blood lst blood = match lst with
  [] -> 0
  | ({name = n; sex = s; blood = b}) :: rest ->
    if b = blood then
      1 + count_blood rest blood
    else
      count_blood rest blood

let test1 = count_blood [] "" = 0
let test2 = count_blood [person1] "" = 0
let test3 = count_blood [person1] "A" = 1
let test4 = count_blood [person1; person2] "B" = 1
let test5 = count_blood human_data "A" = 2
let test6 = count_blood human_data "B" = 1

(*
#use "13_1.ml";;
*)