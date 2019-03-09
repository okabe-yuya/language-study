#use "metro_data.ml";;

(* get_ekikan_kyori: string, string, global_ekikan_list -> int *)
let rec get_ekikan_kyori start_str end_str lst  = match lst with
  [] -> infinity
  | ({start_s = start_s;
      end_s = end_s;
      via = via;
      distance = dis;
      time = time;
    }) :: rest ->
      if start_s = start_str && end_s = end_str || start_s = end_str && end_s = start_str then
        dis
      else
        get_ekikan_kyori start_str end_str rest

(* update_distance: station_t, station_t -> station_t *)
let update_distance decided_station next_station = match (decided_station, next_station) with
  ({name = de_n; station_distance = de_dis; station_list = de_lst},
   {name = ne_n; station_distance = ne_dis; station_list = ne_lst}) ->
    let distance = get_ekikan_kyori de_n ne_n global_ekikan_list in
      if de_dis = infinity then
        next_station
      else if distance +. de_dis < ne_dis then
        {name = ne_n; station_distance = distance +. de_dis; station_list = ne_n :: de_lst}
      else
        next_station


(* update_distance_lst: station_t, station_t list -> station_t list *)
let update_distance_list decide lst = List.map update_distance (decide lst)

let update_distance_list decided lst =
  let func q = update_distance decided q in
    List.map func lst


let update_distance_list decied lst =
  let update_distance decied rest_res = match (decied, rest_res) with
    ({name = f_n; station_distance = f_sd; station_list = f_sl},
     {name = r_n; station_distance = r_sd; station_list = r_sl}) ->
      let distance = get_ekikan_kyori f_n r_n global_ekikan_list in
        if f_sd = infinity then
          rest_res
        else if f_sd +. distance < r_sd then
          {name = r_n; station_distance = f_sd +. distance; station_list = r_n :: f_sl}
        else
          rest_res in
            let func lst = update_distance decied lst in
              List.map func lst

(* 14_13 *)
let new_update_distance_list decied lst =
  List.map (
    fun rcd -> match (rcd, decied) with
      ({name = r_n; station_distance = r_st_dis; station_list = r_st_lst},
       {name = d_n; station_distance = d_st_dis; station_list = d_st_lst}) ->
        let distance = get_ekikan_kyori r_n d_n global_ekikan_list in
          if r_st_dis = infinity then
            rcd
          else if r_st_dis +. distance < d_st_dis then
            {name = d_n; station_distance = r_st_dis +. distance; station_list = d_n :: r_st_lst}
          else
            rcd
  ) lst

let data1 = {name = "代々木公園"; station_distance = 0.0; station_list = ["代々木公園"]}
let data2 = {name = "明治神宮前"; station_distance = infinity; station_list = []}
let return_data1 = {name = "明治神宮前"; station_distance = 1.2; station_list = ["明治神宮前"; "代々木公園"]}
let data3 = {name = "表参道"; station_distance = infinity; station_list = []}
let return_data2 = {name = "表参道"; station_distance = 2.1; station_list = ["表参道"; "明治神宮前"; "代々木公園"]}

(* test for update_distance *)
let test1 = update_distance data1 data2 = return_data1
let test2 = update_distance data1 data1 = data1
let test3 = update_distance data2 data1 = data1
let test4 = update_distance return_data1 data3 = return_data2

(* test for update_distance_list *)
let test5 = update_distance_list data1 [data1; data2; data3]

(* test: new_update_distance_list *)
let test6 = new_update_distance_list data1 [] = []
let test7 = new_update_distance_list data1 [data1; data2] = [
  {name = "代々木公園"; station_distance = 0.; station_list = ["代々木公園"]};
  {name = "明治神宮前"; station_distance = infinity; station_list = []}
]
let test8 = new_update_distance_list return_data1 [data3] = [{name = "表参道"; station_distance = infinity; station_list = []}]

(*
#use "update.ml";;
*)