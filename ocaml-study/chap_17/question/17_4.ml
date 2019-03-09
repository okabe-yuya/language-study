#use "17_2.ml";;
#use "17_3.ml";;

let your_seiza birth_day = match birth_day with
  January(n) -> Otome
  | Febrary(n) -> Otome
  | March(n) -> Otome
  | April(n) -> Otome
  | May(n) -> Otome
  | Jun(n) -> Otome
  | July(n) -> Kani

let test = your_seiza (January 1) = Otome
let test2 = your_seiza (July 17) = Kani

(*
#use "17_4.ml";;
*)