let rec enumerate num =
  if num = 0 then
    []
  else
    num :: enumerate (num - 1)

let fac num = List.fold_right ( * ) (enumerate num) 1

let test1 = fac 0 = 0
let test2 = fac 1 = 1
let test3 = fac 3 = 3 * 2 * 1
let test4 = fac 7 = 7 * 6 * 5 * 4 * 3 * 2 * 1
let test5 = fac 10 = 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

(*
#use "14_16.ml";;
*)