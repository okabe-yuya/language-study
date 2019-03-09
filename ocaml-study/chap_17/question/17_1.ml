type nengou_t =
  Meiji of int
  | Taisho of int
  | Showa of int
  | Heisei of int


let your_age type_n now_year = match type_n with
  Meiji(n) -> now_year - 1867 - n
  | Taisho(n) -> now_year - 1911 - n
  | Showa(n) -> now_year - 1926 - n
  | Heisei(n) -> now_year - 1988 - n


let test1 = your_age (Heisei 8) 2019 = 23
let test2 = your_age (Showa 55) 2019

(*
#use "17_1.ml";;
*)