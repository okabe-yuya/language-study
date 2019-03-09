type new_person_t = {
    name: string;
    blood: string;
}

let fl_count lst blood_type =
  let count_blood rcd = match rcd with
    {name = n; blood = b} -> b = blood_type in
      List.length(List.filter count_blood lst)


let data1 = {name = "okabe1"; blood = "A"}
let data2 = {name = "okabe2"; blood = "B"}
let data3 = {name = "okabe3"; blood = "O"}
let data4 = {name = "okabe4"; blood = "AB"}
let data5 = {name = "okabe5"; blood = "A"}

let test1 = fl_count [] "A" = 0
let test2 = fl_count [data1] "A" = 1
let test3 = fl_count [data1; data2] "A" = 1
let test4 = fl_count [data1; data3] "O" = 1
let test5 = fl_count [data1; data2; data3; data5] "A" = 2

let fl_count lst blood_type =
  List.length(List.filter
    (fun rcd -> match rcd with
      {name = n; blood = b} ->
        b = blood_type) lst)

let test1 = fl_count [] "A" = 0
let test2 = fl_count [data1] "A" = 1
let test3 = fl_count [data1; data2] "A" = 1
let test4 = fl_count [data1; data3] "O" = 1
let test5 = fl_count [data1; data2; data3; data5] "A" = 2

(*
#use "14_6.ml";;
*)