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


let rec dijkstra_main station_lst dis_lst = match station_lst with
  [] -> []
  | first :: rest ->
    let (station, rest_s) = fold_divide_station (first :: rest) in
      let updated_station_lst = update_distance station rest_s dis_lst in
        station :: dijkstra_main updated_station_lst dis_lst

(* 駅の例 *) 
let eki1 = {name="池袋"; station_distance = infinity; station_list = []} 
let eki2 = {name="新大塚"; station_distance = 1.2; station_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {name="茗荷谷"; station_distance = 0.; station_list = ["茗荷谷"]} 
let eki4 = {name="後楽園"; station_distance = infinity; station_list = []} 
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4] 
 
(* テスト *) 
let test1 = dijkstra_main [] global_ekikan_list = [] 
let test2 = dijkstra_main lst global_ekikan_list = 
  [{name = "茗荷谷"; station_distance = 0.; station_list = ["茗荷谷"]}; 
   {name = "新大塚"; station_distance = 1.2; station_list = ["新大塚"; "茗荷谷"]}; 
   {name = "後楽園"; station_distance = 1.8; station_list = ["後楽園"; "茗荷谷"]}; 
   {name = "池袋"; station_distance = 3.; station_list = ["池袋"; "新大塚"; "茗荷谷"]}] 


let dijkstra start_station end_station =
  let start = romaji_to_kanji start_station global_ekikan_list in
    let end = romaji_to_kanji end_station global_ekikan_list in
      let station_lst = make_initial_staition_lst global_ekimei_list start in
        let staion_list2 = dijkstra_main station_lst global_ekikan_list in
          let rec find end_station f_staion_lst = match f_staion_lst with
            [] -> {name = ""; station_distance = infinity; station_list = []}
            | ({ name = n; station_distance = s_dis; station_list = s_lst } as first) :: rest ->
              if n = end_station then
                first
              else
                find end_station rest


(*
#use "main.ml";;
*)