#use "metro_data.ml"
(*
#use "make_station_list.ml";;
*)

(* make_station_list: station_name_t list -> station_t list *)
let rec make_station_list lst = match lst with
  [] -> []
  | ({name_kanji = n_kanji;
      name_kana = n_kana;
      name_romaji = n_romaji;
      group = g
     }) :: rest ->
      if n_kanji = "" then
        []
      else
        {name = n_kanji; station_distance = infinity; station_list = []} :: make_station_list rest

(* initializer_staion_t_list: station_t list, string -> staion_t list *)
let rec initializer_staion_t_list lst str_name = match lst with
  [] -> []
  | ({name = n; station_distance = sta_dis; station_list = sta_lis} as first) :: rest ->
    if n = str_name then
      {name = n; station_distance = 0.0; station_list = [n]} :: rest
    else
      first :: initializer_staion_t_list rest str_name

let map_make_station_list lst =
  List.map(fun rcd -> match rcd with
    {name_kanji = n_kan;
     name_kana = n_kana;
     name_romaji = n_rom;
     group = g} ->
       {name = n_kan; station_distance = infinity; station_list = []}
  ) lst

let map_initializer_staion_t_list lst str_name =
  List.map (
    fun rcd -> match rcd with
      {name = n; station_distance = st_dis; station_list = st_lst} ->
        if n = str_name then
          {name = n; station_distance = 0.0; station_list = [n]}
        else
          rcd
    ) lst

(* map_make_station_init_lst: station_name_t list -> staion_t list *)
let map_makestaion_init_list lst str_name =
  List.map (
    fun station_t_rcd -> match station_t_rcd with
      {name = n; station_distance = st_dis; station_list = st_lst} ->
        if n = str_name then
          {name = n; station_distance = 0.0; station_list = [n]}
        else
          station_t_rcd
  )
    (List.map (
      fun station_name_t_rcd -> match station_name_t_rcd with
        {name_kanji = n_kan;
        name_kana = n_kana;
        name_romaji = n_rom;
        group = g} -> {name = n_kan; station_distance = infinity; station_list = []}
    ) lst)

(* test: make_station_list *)
let test_data1 = [
  {name_kanji="代々木上原"; name_kana="よよぎうえはら"; name_romaji="yoyogiuehara"; group="千代田線"}
]
let test_data2 = [
  {name_kanji="代々木公園"; name_kana="よよぎこうえん"; name_romaji="yoyogikouen"; group="千代田線"};
  {name_kanji="明治神宮前"; name_kana="めいじじんぐうまえ"; name_romaji="meijijinguumae"; group="千代田線"};
]
let test_data1_return = [
  {name = "代々木上原"; station_distance = infinity; station_list = []}
]
let test_data2_return = [
  {name = "代々木公園"; station_distance = infinity; station_list = []};
  {name = "明治神宮前"; station_distance = infinity; station_list = []}
]

let test1 = make_station_list [] = []
let test2 = make_station_list test_data1 = test_data1_return
let test3 = make_station_list test_data2 = test_data2_return

(* test: initializer_staion_t_list *)
let test1 = initializer_staion_t_list [] "" = []
let test2 = initializer_staion_t_list test_data1_return "" = test_data1_return
let test3 = initializer_staion_t_list test_data1_return "代々木上原" = [
  {name = "代々木上原"; station_distance = 0.0; station_list = ["代々木上原"]}
]
let test4 = initializer_staion_t_list test_data2_return "明治神宮前" = [
  {name = "代々木公園"; station_distance = infinity; station_list = []};
  {name = "明治神宮前"; station_distance = 0.0; station_list = ["明治神宮前"]}
]

(* test: map_make_station_list *)
let test1 = map_make_station_list [] = []
let test2 = map_make_station_list test_data1 = test_data1_return
let test3 = map_make_station_list test_data2 = test_data2_return

let test5 = map_initializer_staion_t_list [] "" = []
let test6 = map_initializer_staion_t_list test_data1_return "" = test_data1_return
let test7 = map_initializer_staion_t_list test_data1_return "代々木上原" = [
  {name = "代々木上原"; station_distance = 0.0; station_list = ["代々木上原"]}
]
let test8 = map_initializer_staion_t_list test_data2_return "明治神宮前" = [
  {name = "代々木公園"; station_distance = infinity; station_list = []};
  {name = "明治神宮前"; station_distance = 0.0; station_list = ["明治神宮前"]}
]

(* test: map_makestaion_init_list *)
let test9 = map_makestaion_init_list test_data1 "代々木上原" = [
  {name = "代々木上原"; station_distance = 0.0; station_list = ["代々木上原"]}
]