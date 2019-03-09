(* gcd: int -> int -> int *)
let rec division f_num s_num =
  if s_num = 0 then
   s_num
  else
    let rest = f_num mod s_num in
      if rest = 0 then
        s_num
      else
        division s_num rest

let test1 = division 0 0 = 0
let test2 = division 0 1 = 1
let test3 = division 3355 2379 = 61
let test4 = division 50 35 = 5

(*
#use "15_2.ml";;
*)