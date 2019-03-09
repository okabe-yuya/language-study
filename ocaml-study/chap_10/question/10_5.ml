type gakusei_t = {
  name: string;
  point: int;
}

let student1 = {name = "okabe1"; point = 98}
let student2 = {name = "okabe2"; point = 43}
let student3 = {name = "okabe3"; point = 75}
let student4 = {name = "okabe4"; point = 34}
let student5 = {name = "okabe5"; point = 100}
let class_data = [student1; student2; student3; student4; student5]

(* gakusei_max: gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
  [] -> {name = ""; point = 0}
  | ({name = n; point = p} as first) :: rest ->
    match gakusei_max rest with (* __func_name rest --> listの中の最小値が入っていると仮定?? *)
    {name = lst_n; point = lst_p} ->
      if lst_p < p then
        first
      else
        gakusei_max rest

(* use 局所変数ver *)
let rec gakusei_max_new lst = match lst with
  [] -> {name = ""; point = 0}
  | ({name = n; point = p} as first) :: rest ->
    let minimum_rest = gakusei_max_new rest in
      match minimum_rest with
        {name = lst_n; point = lst_p} ->
          if lst_p < p then
            first
          else
            gakusei_max rest

let test1 = gakusei_max_new class_data = student5
let test2 = gakusei_max_new class_data

(*
#use "10_5.ml";;
*)