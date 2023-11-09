import UIKit

var str1 = String()
//Многосттрочный стринг с символом Юникод
str1 = """
All my life, I could feel an insistent gnawing in the back of my mind.
It was a yearning, a thirst for discovery that could be neither numbed, nor sated.
 (c) Narrator (Ancestor) \u{2665}
"""
//print(str1)

let str2 = "\"Imagination is more important than knowledge\" - Einstein"
//print(str2)

str1 += str2
print(str1)

let x = 3
var str3 = "\(x) divide by 1.5 is \(Double(x)/1.5)" //Интерполяция
str3 = #"\(x) divide by 1.5 is \(Double(x)/1.5)"# //Без интерполяции, почему стало два \?


print("str2 has a \(str2.count) characters")

// Печатаем все символы из строки по одному
for i in str2 {
    print(i)
}

// Печатает всю таблицу умножения размерности n
var n = 10
for i in 1...n {
    for j in 1...n {
        print("\(i) times \(j) is a \(i*j)")
    }
}
//Если str1 является Double по типу, то выводит соответствующую строку, если нет, то другую
if str1 is Double {
    print("str1 is Double")
}
else {
    print("str1 is not a Double")
}
