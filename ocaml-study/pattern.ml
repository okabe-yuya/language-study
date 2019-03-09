let reverse_x points = match points with
    (x, y) -> (x, -y)

let test1 = reverse_x (1,2) = (1, -2)
let test2 = reverse_x (3,6) = (3, -6)

let center points1 points2 =
    match points1 with
    (xa, ya) -> match points2 with (xb, yb)
    -> ((xa + xb)/2, (ya + yb)/2)

let test3 = center (2,2) (2,2) = (2,2)

type book_t = {
    title: string;
    label: string;
    price: int;
    isbn: int;
}

type person_t = {
    name: string;
    tall: float;
    weight: float;
    birth: int;
    blood: string;
}

let human_a = {name = "okabe"; tall = 1.75; weight = 65.2; birth = 20030513; blood = "A"}

let greet human_data = match human_data with
    {name = n; tall = t; weight = w; birth = b; blood = bl; } ->
        n^"さんの血液型は"^bl^"型です"

let test4 = greet human_a = "okabeさんの血液型はA型です"
