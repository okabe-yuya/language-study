(* const person data type *)
type person_t = {
  name: string;
  sex: bool;
}

(* insert: person_t list, per_son_t -> person_t list *)
let rec insert lst target_lst = match lst with
  [] -> [target_lst]
  | ({name = lst_n; sex = lst_s} as first) :: rest -> (
    match target_lst with
    {name = tar_n; sex = tar_s} ->
      if lst_n < tar_n then
        first :: insert rest target_lst
      else
        target_lst :: lst
  )

(* person_sort: person_t list -> person_t list *)
let rec person_sort lst = match lst with
  [] -> []
  | first :: rest -> insert (person_sort rest) first

(* make test data *)
let person1 = {name = "あ"; sex = true}
let person2 = {name = "い"; sex = true}
let person3 = {name = "う"; sex = true}
let person4 = {name = "え"; sex = true}

let test1 = person_sort [] = []
let test2 = person_sort [person1] = [person1]
let test3 = person_sort [person2; person1] = [person1; person2]
let test4 = person_sort [person3; person2; person4; person1] = [person1; person2; person3; person4]
let result1 = person_sort [person1; person4; person3; person2; person1]

(*
#use "10_4.ml";;
*)