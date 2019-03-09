(* load train data *)
#use "metro_data.ml";;

(* romaji_to_kanji: string, global_ekimei_list -> string *)
let rec romaji_to_kanji tar_str lst = match lst with
  [] -> ""
  | ({name_kanji = kanji;
      name_kana = kana;
      name_romaji = romaji}) :: rest ->
        if tar_str = romaji then
          kanji
        else
          romaji_to_kanji tar_str rest

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

(* display_distance: string, string -> string *)
let display_distance start_str end_str =
  let kanji_start_str = romaji_to_kanji start_str global_ekimei_list in
  let kanji_end_str = romaji_to_kanji end_str global_ekimei_list in
  if kanji_start_str = "" || kanji_end_str = "" then
    start_str^"もしくは"^end_str^"という駅は存在しません"
  else
    let station_dis = get_ekikan_kyori kanji_start_str kanji_end_str global_ekikan_list in
    if station_dis = infinity then
      kanji_start_str^"駅と"^kanji_end_str^"駅はつながっていません"
    else
      kanji_start_str^"駅から"^kanji_end_str^"駅までは"^string_of_float station_dis^"kmです"


(* test:  romaji_to_kanji *)
let test1 = romaji_to_kanji "" global_ekimei_list = ""
let test2 = romaji_to_kanji "test" [] = ""
let test3 = romaji_to_kanji "yoyogiuehara" global_ekimei_list = "代々木上原"
let test4 = romaji_to_kanji "kokkaigijidoumae" global_ekimei_list = "国会議事堂前"

(* test:  romaji_to_kanji *)
let test5 = get_ekikan_kyori "" "" global_ekikan_list = infinity
let test6 = get_ekikan_kyori "" "test" global_ekikan_list = infinity
let test7 = get_ekikan_kyori "test" "" global_ekikan_list = infinity
let test8 = get_ekikan_kyori "test" "test" global_ekikan_list = infinity
let test9 = get_ekikan_kyori "代々木上原" "代々木公園" global_ekikan_list = 1.0
let test9 = get_ekikan_kyori "代々木公園" "代々木上原" global_ekikan_list = 1.0

(* test:  romaji_to_kanji *)
let test10 = display_distance "" "" = "もしくはという駅は存在しません"
let tset11 = display_distance "yoyogiuehara" "" = "yoyogiueharaもしくはという駅は存在しません"
let test12 = display_distance "" "yoyogiuehara" = "もしくはyoyogiueharaという駅は存在しません"
let test13 = display_distance "yoyogiuehara" "yoyogikouen" = "代々木上原駅から代々木公園駅までは1.kmです"
let test14 = display_distance "yoyogiuehara" "nogizaka" = "代々木上原駅と乃木坂駅はつながっていません"

(*
#use "base_func.ml";;
*)