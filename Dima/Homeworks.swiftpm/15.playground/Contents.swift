import UIKit

//Создать класс, в котором будет 3 свойства мама, папа, дети. Создать subscript и упорядочить их по индексу

class Family {
    var mom: String
    var dad: String
    var children: [String]
    init(mom: String, dad: String, children: [String]) {
        self.mom = mom
        self.dad = dad
        self.children = children
    }
    subscript (index: Int) -> String? {
        get {
            print("Ребенок с индексом \(index) - это \(children[index])")
            return children[index]
        }
    }
}

let myFam = Family(mom: "Mama", dad: "Papa", children: ["John", "Stan", "Leibniz"])
myFam[1]



//Создать Индекс который будет принимать число умножать его на 100 и делить на 2

class Numbers {
    var a: Double
    init(a: Double) {
        self.a = a
    }
    subscript (index: Int) -> Double {
        var result: Double
        result = Double(index) * 100 / 2
        return result
    }
}

var myNumber = Numbers(a: 90)
myNumber[100]



//Создать свой subscript у которого внутри есть оператор if else

class SuggestedName {
    var trueName: String
    init(trueName: String) {
        self.trueName = trueName
    }
    subscript (name: String) -> Bool {
        if name == trueName {
            print("Верно, ты проходишь")
            return true
        } else {
            print("Ответ отрицательный, fuck you")
            return false
        }
    }
}

var myName = SuggestedName(trueName: "Dima")

myName["Dima"]


//Создать класс человек и в нем 3 свойства: имя, возраст, пол
enum Gender {
    case male
    case female
}

class Human {
    var name: String
    var age: Int
    var gender: Gender
    var fulProfile: String {
        get {
            return name + " " + String(age) + " "
        }
    }
    init(name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func getOlder() {
        self.age += 1
        print("Повзрослел на год")
    }
    func changeName(newName: String) {
        self.name = newName
    }
}


//Создать ещё 2 класса которые наследуются от класса человек и переопределить методы и свойства
class HumanBot: Human {
    override var fulProfile: String {
        get {
            return "Бот"
        }
    }
    init(name: String, age: Int) {
        super.init(name: name, age: age, gender: .male) // пришлось передать какой нибудь гендер
    }
    override func changeName(newName: String) {
        print("Роботам запрещено менять имя")
    }

}

class Alien: Human {
    override var fulProfile: String {
        get {
            return "А тебя это бать не должно"
        }
    }
    init(name: String, gender: Gender) {
        super.init(name: name, age: 0, gender: gender) //пришлось передавать какой то age
    }
    override func getOlder() {
        print("Для НИХ нет такого понятия как возраст")
    }

}

var myBot = HumanBot(name: "R2D2", age: 230)
myBot.gender
myBot.fulProfile
myBot.getOlder()

var myAlien = Alien(name: "COV-120", gender: .female)
myAlien.fulProfile
myAlien.getOlder()
myAlien.age


//Создать словарь, который хранит все типы данных, которые есть, а ключ должен быть только строка (воспользоваться enum для типов данных)
enum TypesOfData {
    case string
    case int
    case character
    case double
    case float
    case bool
    case uint
}

var dictOfTypes: [String: TypesOfData] = ["String": TypesOfData.string, "Int": TypesOfData.int, "Character": TypesOfData.character, "Double": TypesOfData.double, "Float": TypesOfData.float, "Bool": TypesOfData.bool, "UInt": TypesOfData.uint]

//мб я не понял задание
class DictTypes {
    private var data: [String:TypesOfData] = [:]
    subscript (key: String) -> TypesOfData {
        get {
            return data[key]!
        }
        set {
            data[key] = newValue
        }
    }
}
var dic = DictTypes()
dic["String"] = TypesOfData.string
dic["String"]
