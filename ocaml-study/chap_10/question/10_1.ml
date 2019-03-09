let const_array = [1; 3; 4; 7; 8]

(* insert list int -> int *)
let rec insert lst num = match lst with
  [] -> []
  | first :: rest -> if first > num then
                        num :: first :: rest
                     else
                        first :: insert rest num

let test1 = insert const_array 5 = [1; 3; 4; 5; 7; 8]
let test2 = insert [] 4 = []
let test3 = insert [1; 3; 4] 0 = [0; 1; 3; 4]
let test4 = insert [1; 5; 6] 4 = [1; 4; 5; 6]

