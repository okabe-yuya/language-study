type person_t = {
  name: string;
  point: int
}

let student1 = {name = "okabe1"; point = 98}
let student2 = {name = "okabe2"; point = 43}
let student3 = {name = "okabe3"; point = 75}
let student4 = {name = "okabe4"; point = 34}
let student5 = {name = "okabe5"; point = 100}

(* use terminal only *)
(* (fun rcd -> match rcd with {name = n; point = p} -> n) {name = "okabe5"; point = 100}*)
let return_name_omit = fun rcd -> match rcd with {name = n; point = p} -> n
let return_name rcd = match rcd with
  {name = n; point = p} -> n

let test1 = return_name_omit student1 = "okabe1"
let test1 = return_name student1 = "okabe1"
(*
#use "14_9.ml";;
*)