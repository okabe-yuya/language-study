type distance_t = {
  distance: float;
  total_distance: float;
}

(* total_distance: distance_t list -> distance_t list *)
let count_total_distance lst =
  let rec accumulator lst total = match lst with
    [] -> []
    | {distance = dis; total_distance = total_dis} :: rest ->
      {distance = dis; total_distance = total +. dis} :: accumulator rest (total +. dis) in
        accumulator lst 0.0

let data1 = {distance = 0.4; total_distance = 0.0}
let data2 = {distance = 0.3; total_distance = 0.0}
let data3 = {distance = 0.7; total_distance = 0.0}
let data4 = {distance = 0.6; total_distance = 0.0}
let total_return = [
  {distance = 0.4; total_distance = 0.4};
  {distance = 0.3; total_distance = 0.7};
  {distance = 0.7; total_distance = 1.4};
  {distance = 0.6; total_distance = 2.0}
]

let test1 = count_total_distance [data1; data2; data3; data4] = total_return

(*
#use "accumulator.ml";;
*)