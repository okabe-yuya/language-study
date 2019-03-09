(* enumerate: int -> int list *)
let rec enumerate num =
  if num = 0 then
    []
  else
    num :: enumerate (num - 1)

let test1 = enumerate 0 = []
let test2 = enumerate 1 = [1]
let test3 = enumerate 4 = [4; 3; 2; 1]

(* divisor: int -> int list *)
(* 引数値の約数を数値リストにして返す *)
let divisor num = List.filter (fun x -> num mod x = 0) (enumerate num)

let test1 = divisor 0 = []
let test2 = divisor 2 = [2; 1]
let test3 = divisor 6 = [6; 3; 2; 1]

(* perfect: int -> int list *)
(* 引数値のリストから完全数のリストを返す *)
let perfect num =
  List.filter (fun x -> List.fold_right (+) (divisor x) 0 - x = x ) (enumerate num)

(*
#use "divisor.ml";;
*)