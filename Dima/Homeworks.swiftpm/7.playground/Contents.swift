import UIKit

let (a1, a2, a3, a4, a5) = ("1", "2", "3", "4", "5")
//Ищем сумму
var sum: Int = 0
for i in [a1, a2, a3, a4, a5] {
    if Int(i) != nil {
        sum += Int(i)!
    }
    else {
        print("Something wrong with " + i)
    }
}
//5 констант nil
let n1: Int? = nil
let (n2, n3, n4, n5): (String?, Double?, Float?, Bool?) = (nil, nil, nil, nil)


//5 констант с опциональными типами и присваиваем им значения
let (opt1, opt2, opt3, opt4, opt5):(Int?, String?, Double?, Float?, Bool?)

(opt1, opt2, opt3, opt4, opt5) = (32, "s", 2.0, 3.0, true)
opt1
opt2
opt3
opt4
opt5

//Создать переменную строчную, в которую записать свое имя, а затем распечатать ее по буквам
let Name = "Дмитрий"
for i in Name {
    print(i)
}

//Создать массив с целочисленными цифрами в хаотичном порядке. Распечатать в упорядоченном порядке эти цифры
let massive = [23, 24, 1, 100, 2, 5]

for i in massive.sorted() {
    print(i)
}
print("_______")
//И давай еще массив, заполним его случайными числами
//пройдемся и по нему и выведем только четные числа
for i in massive.filter {$0 % 2 == 0} {
    print(i)
}
