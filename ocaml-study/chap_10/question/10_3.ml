type gakusei_t = {
  name: string;
  point: int;
}

let student1 = {name = "okabe1"; point = 98}
let student2 = {name = "okabe2"; point = 43}
let student3 = {name = "okabe3"; point = 75}
let student4 = {name = "okabe4"; point = 34}
let student5 = {name = "okabe5"; point = 100}
let class_data = student1 :: student2 :: student3 :: student4 :: student5 :: []
let sorted_class_data = student5 :: student4 :: student3 :: student2 ::  student1 :: []


(* insert gakusei_t(record) -> list *)
let rec insert target_lst lst = match lst with
  [] -> [target_lst]
  | ({name = lst_n; point = lst_p} as first) :: rest -> (
      match target_lst with
        {name = tar_n; point = tar_p} ->
          if lst_n < tar_n then
            first :: insert target_lst rest
          else
            target_lst :: lst
    )

(* student_sort gakusei_t list -> gakusei_t list *)
let rec student_sort lst = match lst with
  [] -> []
  | first :: rest -> insert first (student_sort rest)

let test4 = student_sort [] = []
let test7 = student_sort [student1] = [student1]
let test5 = student_sort class_data = sorted_class_data
let test6 = student_sort [student1; student2] = [student2; student1]