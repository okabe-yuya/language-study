#use "metro_data.ml";;

let rec divide_station lst = match lst with
  [] -> ({name = ""; station_distance = infinity; station_list = []}, [])
  | first :: rest ->
    let (target, min_dis_record) = divide_station rest in
      match (first, target) with
        ({name = f_n; station_distance = f_st_dis; station_list = f_st_lst},
         {name = t_n; station_distance = t_st_dis; station_list = t_st_lst}) ->
          if t_n = "" then
            (first, min_dis_record)
          else if f_st_dis < t_st_dis then
            (first, target :: min_dis_record)
          else
            (target, first :: min_dis_record)

(* use fold_right func: *)
let fold_divide_station lst = List.fold_right(
  fun first (target, min_dis_record) ->
    match (first, target) with
      ({name = f_n; station_distance = f_st_dis; station_list = f_st_lst},
       {name = t_n; station_distance = t_st_dis; station_list = t_st_lst}) ->
        if t_n = "" then
          (first, min_dis_record)
        else if f_st_dis < t_st_dis then
          (first, target :: min_dis_record)
        else
          (target, first :: min_dis_record)
) lst ({name = ""; station_distance = infinity; station_list = []}, [])

let eki1 = {name="池袋"; station_distance = infinity; station_list = []}
let eki2 = {name="新大塚"; station_distance = 1.2; station_list = ["新大塚"; "茗荷谷"]}
let eki3 = {name="茗荷谷"; station_distance = 0.; station_list = ["茗荷谷"]}
let eki4 = {name="後楽園"; station_distance = infinity; station_list = []}

(* 駅リストの例 *)
let lst = [eki1; eki2; eki3; eki4]
let test1 = divide_station lst = (eki3, [eki1; eki2; eki4])
let test2 = fold_divide_station lst = (eki3, [eki1; eki2; eki4])

(*
#use "divide.ml";;
*)

let rec tet lst = match lst with
  [] -> 0
  | first :: rest -> first + tet rest

let test1 = tet [1; 3; 4; 5]