(fun num -> num * num +1) 5 = 26
let calc = fun num -> num * num + 1
let calc_omit num = num * num + 1

let test1 = calc 5 = 26
let test2 = calc_omit 5 = 26
(*
#use "14_8.ml";;
*)