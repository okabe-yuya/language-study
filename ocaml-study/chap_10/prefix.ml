let rec add_to_each num lst = match lst with
  [] -> []
  | first :: rest -> (num :: first) :: add_to_each num rest

let rec prefix lst = match lst with
  [] -> []
  | first :: rest -> [first] :: (prefix test)


let test1 = prefix [1; 2; 3; 4]