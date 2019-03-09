(* power: int -> int *)
let rec power base_num power_num =
  if power_num = 0 then
    1
  else
    base_num * power base_num ( power_num - 1)

let test1 = power 3 0 = 1
let test2 = power 3 1 = 3
let test3 = power 3 2 = 9
let test4 = power 3 3 = 27


(*
#use "power.ml";;
*)