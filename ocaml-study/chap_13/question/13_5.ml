let add3 num = num + 3
let twice2 func =
  let g x = func (func x) in
    g

let test1 = (twice2 add3) 4
let g x = (twice2 twice2) x

let test2 = g 4

(*
#use "13_5.ml";;
*)