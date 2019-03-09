(* concat: str list -> string *)
let concat lst = List.fold_right (^) lst ""


let test1 = concat [] = ""
let test2 = concat ["a"] = "a"
let test3 = concat ["a"; "b"] = "ab"
let test4 = concat ["I "; "Love "; "You."] = "I Love You."


(*
#use "14_14.ml";;
*)