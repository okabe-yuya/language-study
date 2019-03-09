type gakusei_t = {
  name: string;
  point: int;
  rank: string
}

let student1 = {name = "okabe1"; point = 98; rank = "A"}
let student2 = {name = "okabe2"; point = 43; rank = "B"}
let student3 = {name = "okabe3"; point = 75; rank = "A"}
let student4 = {name = "okabe4"; point = 34; rank = "C"}
let student5 = {name = "okabe5"; point = 100; rank = "D"}
let class_data = [student1; student2; student3; student4; student5]

(* count: list -> int * int * int * int *)
let rec count lst = match lst with
  [] -> (0, 0, 0, 0)
  | ({name = tar_n; point = tar_p; rank = tar_r} as first) :: rest ->
    let (a, b, c, d) = count rest in
      if tar_r = "A" then
        (a + 1, b, c, d)
      else if tar_r = "B" then
        (a, b + 1, c, d)
      else if tar_r = "C" then
        (a, b, c + 1, d)
      else
        (a, b, c, d + 1)

let test1 = count class_data
(*
# use "count.ml";;
*)