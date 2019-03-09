type person_t = {
  name: string;
  sex: bool;
  blood: string;
}

let person1 = {name = "あ"; sex = true; blood = "A"}
let person2 = {name = "い"; sex = true; blood = "B"}
let person3 = {name = "う"; sex = true; blood = "AB"}
let person4 = {name = "え"; sex = true; blood = "O"}
let person5 = {name = "お"; sex = true; blood = "A"}
let person6 = {name = "か"; sex = true; blood = "A"}
let person7 = {name = "き"; sex = true; blood = "B"}
let person8 = {name = "く"; sex = true; blood = "O"}

(* blood_count: person_t list -> int * int * int * int *)
let rec blood_count lst = match lst with
  [] -> (0, 0, 0, 0)
  | ({name = tar_n; sex = tar_s; blood = tar_b} as first) :: rest ->
    let (a, b, o, ab) = blood_count rest in
      if tar_b = "A" then
        (a + 1, b, o, ab)
      else if tar_b = "B" then
        (a, b + 1, o, ab)
      else if tar_b = "O" then
        (a, b, o + 1, ab)
      else
        (a, b, o, ab + 1)

let test1 = blood_count [] = (0, 0, 0, 0)
let test2 = blood_count [person1] = (1, 0, 0, 0)
let test3 = blood_count [person1; person1] = (2, 0, 0, 0)
let test4 = blood_count [person1; person2; person3; person4; person5] = (2, 1, 1, 1)
let test5 = blood_count [person1; person2; person3; person4; person5; person6; person7; person8] = (3, 2, 2, 1)

(*
#use "10_7.ml";;
*)