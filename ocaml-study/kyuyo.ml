let zikyu = 850
let yugu_zikyu = 900
let kyuyo hour =
    hour * (if hour > 30 then yugu_zikyu else zikyu)

let test1 = kyuyo 10 = 8500
let test2 = kyuyo 0 = 0
let test9 = kyuyo 31 = 27900

let tsuru_no_ashi bird_num = bird_num * 2
let test3 = tsuru_no_ashi 2 = 4
let test4 = tsuru_no_ashi 4 = 8

let kame_no_ashi kame_num = kame_num * 4

let total_leg tsuru kame = tsuru_no_ashi tsuru + kame_no_ashi kame
let test5 = total_leg 1 1 = 6
let test6 = total_leg 2 2 = 12

let tsurukame total leg_num = total - (leg_num - 2 * total) / 2

let test7 = tsurukame 2 6 = 1
let test8 = tsurukame 10 28 = 6

let jikan time = if time > 12 then "午後" else "午前"
let test10 = jikan 11 = "午前"
let test11 = jikan 13 = "午後"


let bmi tall weight = weight /. tall ** 2.0
let taikei tall weight =
    if bmi tall weight  > 30.0 then
        "高度肥満"
    else if 25.0 < bmi tall weight && bmi tall weight <= 30.0 then
        "肥満"
    else if 18.5 <= bmi tall weight && bmi tall weight <= 25.0 then
        "標準"
    else
        "やせ"

let test12 = taikei 1.78 65.0 = "標準"
let test13 = taikei 1.78 123.0 = "高度肥満"

let total_num kumi = match kumi with
    (a, b, c) -> a + b + c

let test14 = total_num (1,2,3) = 6
let test15 = total_num (3,5,7) = 15
