(* fold_left: 'a func -> 'a lst -> 'a -> 'a lst *)
let old_fold_left func lst init =
  let rec accumulator lst r_lst = match lst with
    [] -> r_lst
    | first :: rest -> accumulator rest (func init first) in
      accumulator lst init

let rec fold_left func lst init = match lst with
  [] -> init
  | first :: rest -> fold_left func rest ((func init first))


let tmp_func num1 num2  = num1 + num2

let test3 = fold_left (fun lst num -> num :: lst) [1; 2; 3; 4] [] = [4; 3; 2; 1]
let test3 = fold_left tmp_func [1; 2; 3; 4] 0 = 10


(*
#use "16_2.ml";;
*)