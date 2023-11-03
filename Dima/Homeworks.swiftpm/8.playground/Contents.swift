import UIKit

//Создать цикл в цикле. В первом цикле интервал до 200. Во втором цикле делаем так, как доходим до 15 элемента в первом цикле, выходим из двух циклов
var sum: Int = 0
var breakFlag = false
for i in 1...200 {
    sum += i
    for j in 1...10 {
        if i == 15 {
            breakFlag = true
            break
        }
    }
    if breakFlag == true {
        break
    }
}

//Создать в if и отдельно в switch программу которая будет смотреть на возраст человека и говорить куда ему идти в школу, в садик, в универ, на работу, на пенсию и тд

let age = 700

if age >= 0 && age <= 6 {
    print("Тебе в садик")
} else if age >= 7 && age <= 18 {
    print("Тебе в школу")
} else if age >= 19 && age <= 64 {
    print("Работай")
} else if age > 65 && age <= 120 {
    print("Скоро все)))")
} else if age > 500 {
    print ("wtf-_-")
} else {
    print("Не понял тебя")
}

switch age {
case 0...6:
    print("Тебе в садик")
case 7...18:
    print("Тебе в школу")
case 19...64:
    print("Работай")
case 65...120:
    print("Скоро все)))")
case 500...:
    print ("wtf-_-")
    
default:
    print("Не понял тебя")
}

//Создать все циклы for in которые знаете
let Array = [1, 2]
var str = "blabla"
let klads = [(51.2039434045, 39.2309523059), (13.13414332,14.12414134)]
for i in 1...10{
    sum += i
}
for i in Array {
    print(i)
}
for i in str {
    str += String(i)
}
for (x,y) in klads {
    print("В подъезде лежит дверь, в обшивке слева: \(x), \(y)")
}

//В switch и отдельно в if создать систему оценивания школьников по 12 бальной системе и и высказывать через print мнение

let Grade = 2
switch Grade {
case 1...4:
    print("Плохо")
case 5...8:
    print("Удовлетворительно")
case 9...10:
    print("Хорошо")
case 11...12:
    print("Отлично")
default:
    print("Введите действительную оценку")
}

if Grade >= 1 && Grade <= 4 {
    print("Плохо")
} else if Grade >= 5 && Grade <= 8{
    print("Удовлетворительно")
} else if Grade >= 9 && Grade <= 10 {
    print("Хорошо")
} else if Grade >= 11 && Grade <= 12 {
    print("Отлично")
} else {
    print("Введите дейтсвительую оценку")
}


//Создать массив(без тюплов / кортежей) с именами всех членов вашей семьи включая родственников, чтобы количество имен было не менее 10 и отсортируйте, распечатайте по алфавиту их в консоль

let names = ["Sinji", "Saber", "Jeanne", "Dyormite", "Pisos", "Besos", "McLover", "McFucker", "Big", "Za"]

for i in names.sorted() {
    print(i)
}
