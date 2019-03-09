let const_array = [5; 3; 8; 1; 7; 4]
let sorted_array = [1; 3; 4; 5; 7; 8]

(* insert list int -> int *)
let rec insert lst num = match lst with
  [] -> [num]
  | first :: rest ->
    if first < num then
      first :: insert rest num
    else
      num :: lst

(* ins_sort list -> list  *)
let rec ins_sort lst = match lst with
  [] -> []
  | first :: rest -> insert (ins_sort rest) first

(* test case *)
let test1 = ins_sort const_array = sorted_array
let test2 = ins_sort [] = []
let test3 = ins_sort [1] = [1]
let test4 = ins_sort [3; 6; 4] = [3; 4; 6]

