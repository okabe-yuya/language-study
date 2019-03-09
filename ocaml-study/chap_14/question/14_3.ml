(* concat: string, str list -> string *)
let concat first rest_res = first ^ rest_res

(* fold_right_concat:  str list -> string *)
let fold_right_concat lst = List.fold_right concat lst ""

let test1 = fold_right_concat [] = ""
let test2 = fold_right_concat ["a"] = "a"
let test3 = fold_right_concat ["a"; "b"] = "ab"
let test4 = fold_right_concat ["I"; " "; "Love"; " "; "You"] = "I Love You"

(* use 局所関数定義 *)
let new_fold_right_concat lst =
  let concat first rest_res = first ^ rest_res in
    List.fold_right concat lst ""

let test1 = new_fold_right_concat [] = ""
let test2 = new_fold_right_concat ["a"] = "a"
let test3 = new_fold_right_concat ["a"; "b"] = "ab"
let test4 = new_fold_right_concat ["I"; " "; "Love"; " "; "You"] = "I Love You"

let new_fold_right_concat lst =
  List.fold_right (fun str1 str2 -> str1 ^ str2) lst ""

let test1 = new_fold_right_concat [] = ""
let test2 = new_fold_right_concat ["a"] = "a"
let test3 = new_fold_right_concat ["a"; "b"] = "ab"
let test4 = new_fold_right_concat ["I"; " "; "Love"; " "; "You"] = "I Love You"


(*
#use "14_3.ml";;
*)