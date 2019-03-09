(* minimum: int list -> int *)
let rec minimum lst = match lst with
  [] -> max_int
  | first :: rest ->
    let min_rest = minimum rest in
      if first <= minimum rest then
        first
      else
        min_rest

let test1 = minimum [3; 4; 1; -4]
let test2 = minimum []

(*
#use "minimum.ml";;
 *)