#use "metro_data.ml";;

(* adjustment_insert station_name_t list, station_name_t -> station_name_t list *)
let rec adjustment_insert lst tar_record = match lst with
  [] -> [tar_record]
  | ({name_kanji = n_kanji;
      name_kana = n_kana;
      name_romaji = n_romaji;
      group = g} as first) :: rest -> (match tar_record with
        {name_kanji = tar_kanji;
         name_kana = tar_kana;
         name_romaji = tar_romaji;
         group = tar_g
        } ->
          if n_kana = tar_kana then
            adjustment_insert rest tar_record
          else
            if n_kana < tar_kana then
              first :: adjustment_insert rest tar_record
            else
              tar_record :: lst
      )

(* station_name_sort: station_name_t list -> station_name_t list *)
let rec station_name_sort lst = match lst with
  [] -> []
  | first :: rest -> adjustment_insert (station_name_sort rest) first

(* test: station_name_sort *)
let test1_data = [
  {name_kanji="代々木上原"; name_kana="よよぎうえはら"; name_romaji="yoyogiuehara"; group="千代田線"};
]
let test2_data = [
  {name_kanji="代々木上原"; name_kana="よよぎうえはら"; name_romaji="yoyogiuehara"; group="千代田線"};
  {name_kanji="代々木上原"; name_kana="よよぎうえはら"; name_romaji="yoyogiuehara"; group="千代田線"};
]
let test3_data = [
  {name_kanji="代々木上原"; name_kana="よよぎうえはら"; name_romaji="yoyogiuehara"; group="千代田線"};
  {name_kanji="代々木上原"; name_kana="よよぎうえはら"; name_romaji="yoyogiuehara"; group="千代田線"};
  {name_kanji="表参道"; name_kana="おもてさんどう"; name_romaji="omotesandou"; group="千代田線"};
  {name_kanji="乃木坂"; name_kana="のぎざか"; name_romaji="nogizaka"; group="千代田線"};
]
let test3_data_return = [
  {name_kanji="表参道"; name_kana="おもてさんどう"; name_romaji="omotesandou"; group="千代田線"};
  {name_kanji="乃木坂"; name_kana="のぎざか"; name_romaji="nogizaka"; group="千代田線"};
  {name_kanji="代々木上原"; name_kana="よよぎうえはら"; name_romaji="yoyogiuehara"; group="千代田線"};
]

let test1 = station_name_sort [] = []
let test1 = station_name_sort [] = []
let test2 = station_name_sort test1_data = test1_data
let test3 = station_name_sort test2_data = test1_data
let test4 = station_name_sort test3_data = test3_data_return
let test5 = station_name_sort global_ekimei_list

(*
#use "station_name_sort.ml";;
*)
