(* progression: int -> int *)
let rec progression num =
  if num = 0 then
    3
  else
    2 * progression (num -1) -1

let test1 = progression 0 = 3
let test2 = progression 1 = 5
let test3 = progression 2 = 9
let test4 = progression 3 = 17
let test5 = progression 4 = 33

(*
#use "11_2.ml";;
*)