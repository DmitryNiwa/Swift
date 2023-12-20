import UIKit

//Создать любой Generic для классов, структур, методов, перечислений (по 1 на каждый)

class SomeEl<T> {
    var el: T
    init(el: T) {
        self.el = el
    }
    
    func firstMoreThanSecond<T:Comparable> (el1: T, el2: T) -> Bool {
        if el1 > el2 {
            true
        } else {
            false
        }
    }
}

var someEl = SomeEl(el: "Da")
someEl.firstMoreThanSecond(el1: 10, el2: 9)

struct Element<T> {
    var name: String
    var atr1: T
    var atr2: T
    var atr3: T
}

var el = Element(name: "Furion", atr1: 22, atr2: 37.0, atr3: 10)

enum atr<T> {
    case atr1(T)
    case atr2(String)
    case atr3(T)
}

let inst = atr<Int>.atr1(23)
let inst2 = atr<String>.atr2("String")
let inst3 = atr<Double>.atr3(37.0)
//почему здесь явно нужно указывать тип я так и не понял. И вообще я ожидал, что atr1 и atr3 должны быть одного типа, но как оказалось пофиг


//Написать функцию, которая принимает Generic объект и складывает в массив/словарь (на выбор)

var array: [Any] = []
func appendArray <T> (element: T) {
    array.append(element)
}

appendArray(element: 12)
appendArray(element: "12")
appendArray(element: 13.0)

print(array)

//Написать класс на свое усмотрение (любые методы, проперти) универсального типа. Используя extension, расширить класс.

class AnimalBeing<T> {
    var name: String
    var speech: T
    init(name: String, speech: T) {
        self.name = name
        self.speech = speech
    }
    
    func say() {
        print(self.speech)
    }
}

var dog = AnimalBeing(name: "Dog", speech: "Bark")
dog.say()
var alien = AnimalBeing(name: "Alien", speech: 232)
alien.say()

extension AnimalBeing {
    func sayHello() {
        print("Hello, \(self.speech)")
    }
}

alien.sayHello()
dog.sayHello()
