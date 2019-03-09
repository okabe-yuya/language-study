type student_t = {
  name: string;
  point: int;
  rank: string
}

(* student_aggregate: student_t, student_t list -> int *)
let student_aggregate student rest_res = match student with
  {name = n; point = p; rank = r} -> p + rest_res

let fold_right_student_aggregate lst = List.fold_right student_aggregate lst 0

let student1 = {name = "okabe1"; point = 98; rank = "A"}
let student2 = {name = "okabe2"; point = 43; rank = "B"}
let student3 = {name = "okabe3"; point = 75; rank = "A"}
let student4 = {name = "okabe4"; point = 34; rank = "C"}
let student5 = {name = "okabe5"; point = 100; rank = "D"}

let test1 = fold_right_student_aggregate [] = 0
let test2 = fold_right_student_aggregate [student1] = 98
let test3 = fold_right_student_aggregate [student1; student2] = 141
let test4 = fold_right_student_aggregate [student5; student3; student4] = 209

(* use 局所関数定義 *)
let new_fl_student_aggregate lst =
  let student_aggregate first rest_res = match first with
    {name = n; point = p; rank = r} -> p + rest_res in
      List.fold_right student_aggregate lst 0

let test1 = new_fl_student_aggregate [] = 0
let test2 = new_fl_student_aggregate [student1] = 98
let test3 = new_fl_student_aggregate [student1; student2] = 141
let test4 = new_fl_student_aggregate [student5; student3; student4] = 209

let new_fl_student_aggregate lst =
  List.fold_right (
    fun first rest_res -> match first with
      {name = n; point = p; rank = r} -> p + rest_res) lst 0

let test1 = new_fl_student_aggregate [] = 0
let test2 = new_fl_student_aggregate [student1] = 98
let test3 = new_fl_student_aggregate [student1; student2] = 141
let test4 = new_fl_student_aggregate [student5; student3; student4] = 209


(*
#use "14_4.ml";;
*)