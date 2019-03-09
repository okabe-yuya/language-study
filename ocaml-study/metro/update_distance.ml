#use "metro_data.ml";;
#use "make_station_list.ml";;
#use "base_func.ml";;

let data1 = {name = "代々木公園"; station_distance = infinity; station_list = []}
let data2 = {name = "代々木公園"; station_distance = 0.0; station_list = ["代々木公園"]}
let data4 = {name = "明治神宮前"; station_distance = infinity; station_list = []}
let data4 = {name = "明治神宮前"; station_distance = 0.0; station_list = ["明治神宮前"]}

(* add 16_3,4,5 *)

(* update_distance station_t, station_t -> station_t *)
let update_distance lst1 lst2 global_ekimei_lst = match (lst1, lst2) with
  ({name = n1; station_distance = s_dis1; station_list = s_lst1},
   {name = n2; station_distance = s_dis2; station_list = s_lst2}) ->
    let distance = get_ekikan_kyori n1 n2 global_ekimei_lst in
      if distance = infinity then
        lst2
      else if distance +. s_dis1 < s_dis2 then
        {name = n2; station_distance = distance +. s_dis1; station_list = n2 :: s_lst2}
      else
        lst2



(*
#use "update_distance.ml";;
*)