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
            if index == 0 {
                print(mom)
                return mom
            } else if index == 1 {
                print(dad)
                return dad
            }
            if index >= 2 {
                print("Ребенок с индексом \(index - 2) - это \(children[index - 2])")
                return children[index - 2]
            } else {
                return nil
            }
        }
    }
}

let myFam = Family(mom: "Mama", dad: "Papa", children: ["John", "Stan", "Leibniz"])
myFam[4]



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
    case custom (String)
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
    init(name: String, age: Int, gender: Gender = .male) {
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
    func changeGender (newGender: Gender) {
        self.gender = newGender
    }
}
var hum = Human(name: "Humorc", age: 40, gender: .custom("Smorc"))
hum.changeGender(newGender: .male)
hum.gender

//Создать ещё 2 класса которые наследуются от класса человек и переопределить методы и свойства
class HumanBot: Human {
    override var fulProfile: String {
        get {
            "Бот"
        }
    }
    override init(name: String, age: Int, gender: Gender = .female) { //оверрайдим из-за переопределения гендера по умолчанию
        super.init(name: name, age: age, gender: gender) // пришлось передать какой нибудь гендер
    }
    override func changeName(newName: String) {
        print("Роботам запрещено менять имя")
    }

}

class Alien: Human {
    override var fulProfile: String {
        get {
            "А тебя это бать не должно"
        }
    }
    init(name: String, gender: Gender) {
        super.init(name: name, age: 0, gender: gender) //пришлось передавать какой то age
    }
    override func getOlder() {
        print("Для НИХ нет такого понятия как возраст")
    }

}

var myBot = HumanBot(name: "R2D2", age: 230, gender: .male)
myBot.gender
myBot.fulProfile
myBot.getOlder()

var myAlien = Alien(name: "COV-120", gender: .female)
myAlien.fulProfile
myAlien.getOlder()
myAlien.age


//Создать словарь, который хранит все типы данных, которые есть, а ключ должен быть только строка (воспользоваться enum для типов данных)
enum TypesOfData {
    case string (String)
    case int (Int)
    case character (Character)
    case double (Double)
    case float (Float)
    case bool (Bool)
    case uint (UInt)
}

var dictOfTypes: [String: TypesOfData] = ["String": TypesOfData.string ("String"), "Int": TypesOfData.int(20), "Character": TypesOfData.character("A"), "Double": TypesOfData.double(23.8), "Float": TypesOfData.float(20.11122), "Bool": TypesOfData.bool(true), "UInt": TypesOfData.uint(1)]
//Без указания конкретных значений не получается
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
dic["String"] = TypesOfData.string ("sas") //та же история, не получается без присваивания значения
dic["String"]

//давай метод напишем, который будет такой словарь принимать, и распечатывать только численные значения

func getRawValue (a: TypesOfData) -> Any {
    switch a {
    case .string(let stringValue):
        return stringValue
    case .bool(let boolValue):
        return boolValue
    case.character(let charValue):
        return charValue
    case .double(let doubleValue):
        return doubleValue
    case .float(let floatValue):
        return floatValue
    case .int(let intValue):
        return intValue
    case .uint(let uintValue):
        return uintValue
    }
}

func printAllNumbers (dict: [String: TypesOfData]) {
    for (_, value) in dict {
        if let val = getRawValue(a: value) as? Int { //я думал сделать приведения всех численныъ типов к Double, т.к. все остальные численные типы можно привести к нему
            print(val)
        } else if let val = getRawValue(a: value) as? Double {
            print(val)
        } else if let val = getRawValue(a: value) as? Float {
            print(val)
        } else if let val = getRawValue(a: value) as? UInt {
            print(val)
        }
    }
}

printAllNumbers(dict: dictOfTypes)

