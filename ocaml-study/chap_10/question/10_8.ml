type person_t = {
  name: string;
  sex: bool;
  blood: string;
}

let person1 = {name = "あ"; sex = true; blood = "A"}
let person2 = {name = "い"; sex = true; blood = "B"}
let person3 = {name = "う"; sex = true; blood = "AB"}
let person4 = {name = "え"; sex = true; blood = "O"}
let human_data = [person1; person2; person3; person4]

(* blood_count: person_t list -> int * int * int * int *)
let rec blood_count lst = match lst with
  [] -> (0, 0, 0, 0)
  | ({name = tar_n; sex = tar_s; blood = tar_b}) :: rest ->
    let (a, b, o, ab) = blood_count rest in
      if tar_b = "A" then
        (a + 1, b, o, ab)
      else if tar_b = "B" then
        (a, b + 1, o, ab)
      else if tar_b = "O" then
        (a, b, o + 1, ab)
      else
        (a, b, o, ab + 1)

(* most_blood: person_t list -> string *)
let most_blood lst =
  let (a, b, o, ab) = blood_count lst in
    let max_blood = max(max a b)(max o ab) in
      if max_blood = a then
        if a = 0 then "None" else "A"
      else if max_blood = b then "B"
      else if max_blood = o then "O"
      else if max_blood = ab then "AB"
      else "None"


let test1 = most_blood [] = "None"
let test2 = most_blood [person1] = "A"
let test3 = most_blood [person1; person1; person3] = "A"

(*
#use "10_8.ml";;
*)