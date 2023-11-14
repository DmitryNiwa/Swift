import UIKit

//Создать класс "Students", добавить ему property: dateOfBirth, skills. Cjplfnm свои структуры с разными видами свойств: сохраняемые/не сохраняемые, вычисляемые, свойства типа и т.д.

class Students {
    var dateOfBirth = String()
    var skills = [String]()
}


//Структура персонажа с хп и атрибутами. От силы зависит хп, от интеллекта мана
let MaxLevel = 25
struct Hero {
    static var baseHP = 450
    static var baseMP = 370
    var lvl:Int  {
        didSet {
            if lvl > MaxLevel {
                lvl = oldValue
                print("Уровень не может быть больше 25")
            }
        }
    }
    init (lvl:Int) {
        if lvl > MaxLevel {
            self.lvl = MaxLevel
            print("Присвоен уровень 25, уровень не может быть выше")
        } else{
            self.lvl = lvl
        }
    }
    var str: Int {
        get {
            return 23 + lvl * 2
        }
    }
    var int: Int {
        get {
            return 17 + lvl * 3
        }
    }
    var HP: Int {
        get {
            return Hero.baseHP + str * 19
        }
    }
    var MP: Int {
        get {
            return Hero.baseMP + int * 13
        }
    }
}

var FacelessVoid = Hero(lvl: 23)
FacelessVoid.lvl = 27
FacelessVoid.HP
FacelessVoid.MP
FacelessVoid.str


//Написать структуру "CreateTriangle", с двумя свойствами - угол A, угол C. В которые мы можем записать какие-то значения, и сделать вычисляемое свойство угол B, которые будет вычисляться по правилу суммы углов треугольника (180 градусов). То есть, мы записываем в угол A - 50 градусов, C - 120 градусов, а в B будет автоматически вычисляться свойство и возвращать нам 10 градусов

struct CreateTriangle {
    var angleA: Double
    var angleB: Double
    init?(angleA: Double, angleB: Double) {
        if ((angleA + angleB) >= 180.0 || angleA <= 0) || angleB <= 0 {
            print("Такого треугольника не существует, введите новые значения")
            return nil
        } else {
            self.angleA = angleA
            self.angleB = angleB
        }
    }
    var angleC: Double {
        get {
            return 180.0 - angleA - angleB
        }
    }
    
}

var triangle = CreateTriangle(angleA: 80, angleB: -70)
triangle?.angleC


//Создать структуру "Резюме", у которой есть такие свойства:
//- Фамилия,
//- Имя,
//- Должность (может быть enum, с определенным набором должностей)
//- Опыт,
//- Контактные данные (телефон, емейл) (Может быть другой структурой)


enum Position {
    case soldier
    case capo
    case underboss
    case boss
}

struct Resume {
    var firstName: String
    var lastName: String
    var exp:Int
    var position: Position
    struct Contacts {
        var email: String
        var phone: String
    }
    var contacts: Contacts
}
    
var Bob = Resume(firstName: "Bob", lastName: "Counter", exp: 3, position: .capo, contacts: Resume.Contacts(email: "bob.nababkah@gmail.com", phone: "89231328549"))
Bob.contacts.email


//Написать класс, в котором есть 4 метода:
//- Пустой, которая просто выводит сообщение через print;
//- Который принимаете параметры и выводит их в консоль;
//- Который принимает и возвращает параметры;
//- Который принимает замыкание и распечатывает результаты в консоль.

class NumberThings {
    var number1: Int
    var number2: Int
    init(number1: Int, number2: Int) {
        self.number1 = number1
        self.number2 = number2
    }
    var sum: Int {
        get {
            return number1 + number2
        }
    }
    func printSum() {
        print(self.sum)
    }
    func printNumbers(param1:Int, param2: Int) {
        print("первое - \(param1), второе - \(param2)")
    }
    func sumOfThreeNumbers(number1: Int, number2: Int, number3: Int) -> Int {
        return number1 + number2 + number3
    }
    func closureInput (array: [Int], closure: ([Int]) -> Void){
        closure(array)
    }
}

var numbers = NumberThings(number1: 12, number2: 17)
numbers.printSum()
numbers.printNumbers(param1: 2, param2: 3)
let sumOfThreeNumbers = numbers.sumOfThreeNumbers(number1: 2, number2: 3, number3: 4)

var closure: ([Int]) -> Void = { array in
    print("Четные числа из массива: \(array.filter { $0 % 2 == 0 })")
}

numbers.closureInput(array: [2,3,4,5,6,7,8,9,10,1,12,12,13,14,15,16], closure: closure)
