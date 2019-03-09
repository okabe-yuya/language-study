let season = "春" :: "夏" :: "秋" :: "冬" :: []
let value_season = ["春"; "夏"; "秋"; "冬"]

type  person_t = {
    name: string;
}

let a_class = {name = "okabe"} ::
              {name = "okane"} ::
              {name = "okahe"} :: []

let rec contain_zero lst = match lst with
    [] -> false
    | first :: rest -> if first = 0 then true
                        else if first = 5 then true
                        else contain_zero rest


let test1 = contain_zero [3;0;3] = true
let test2 = contain_zero [0;1] = true
let test3 = contain_zero [3;2;4] = false
let test4 = contain_zero [5] = true


let rec length lst = match lst with
    [] -> 0
    | first :: rest -> 1 + length rest

let test5 = length [1;2;3] = 3
let test6 = length [] = 0
let test7 = length [2;3;4;3;4] = 5
let test8 = length [1;2]

let rec even lst = match lst with
    [] -> []
    | first :: rest -> if first - (first / 2) * 2 = 0 then first :: even rest
                       else even rest

let test9 = even [2; 4; 6] = [2; 4; 6]
let test10 = even [1; 3] = []
let test11 = even [] = []

let rec concat lst  = match lst with
    [] -> ""
    | first :: rest -> first ^ concat rest

let test12 = concat ["a"; "b"; "c"] = "abc"
let test13 = concat ["春"; "夏"] = "春夏"
let test14 = concat ["今夜も"; "マインクラフト"]

type new_person_t = {
    name: string;
    blood: string;
}

let data1 = []
let data2 = [{name = "okabe"; blood = "A"}]
let data3 = [{name = "okabe"; blood = "B"}; {name="okane"; blood = "O"}]
let data4 = [
    {name = "oka"; blood = "A"};
    {name = "oka"; blood = "A"}
]

let rec count_blood_A data = match data with
    [] -> 0
    | {name = n; blood = b;} :: rest -> if b = "A" then 1 + count_blood_A rest
                                        else count_blood_A rest

let test15 = count_blood_A data1 = 0
let test16 = count_blood_A data2 = 1
let test17 = count_blood_A data3 = 0
let test18 = count_blood_A data4 = 2

let rec name_list data = match data with
    [] -> []
    | {name = n; blood = b;} :: rest -> n :: name_list rest

let test19 = name_list data3
