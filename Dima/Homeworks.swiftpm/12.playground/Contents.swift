import UIKit

//Создать класс родитель и 2 класса наследника. Например, родитель - животное, а 2 наследника: жираф и крокодил. Распечатать их общее родительское свойство, а затем уникальные свойства

class Animal {
    var age = UInt()
    var name = String()
    init (age: UInt, name: String) {
        self.age = age
        self.name = name
    }
}

class Dog: Animal {
    enum Size {
        case Big
        case Medium
        case Small
    }
    var size: Size
    init (age: UInt, name: String, size: Size) {
        self.size = size
        super.init(age: age, name: name) //вызываем инит из родительского класса
    }
}

class Parrot: Animal {
    var colour = String()
    init (age: UInt, name: String, colour: String) {
        self.colour = colour
        super.init(age: age, name: name)
    }
}

let dog = Dog(age: 42, name: "Вася", size: .Medium)
let parrot = Parrot(age: 4, name: "Попка", colour: "Ультрамариновый")

var dogSize = String()
switch dog.size {
case .Big:
    dogSize = "Большой"
case .Medium:
    dogSize = "Обычный"
case .Small:
    dogSize = "Мелкий"
}

print("Пёс \(dog.name) - \(dog.age) лет, он \(dogSize), а попуг \(parrot.name) - \(parrot.age) года, он \(parrot.colour)")


//Написать программу, в которой создать класс Car *name*, *countWheels* и несколько методов - *ride*(выводит произведение свойств), *stop*, *explode*

class Car {
    var name = String()
    var countWheels = Int()
    var speedMulitplicator = 3
    var isAlive = true
    init (name: String, countWheels: Int) {
        self.name = name
        self.countWheels = countWheels
    }
    
    //Проверяем, что машина еще на ходу с помощью приватного метода, чтобы его нельзя было вызвать через экземплар классаё
    private func checkIsAlive() -> Bool {
        if !isAlive {
            print("Машина \(name) разбита")
            return false
        }
        return true
    }
    
    //Выводит скорость машины основываясь на мультипликаторе скорости и количестве колес
    func ride() {
        guard checkIsAlive() else {return} //Крутая штука надо запомнить про guard
        let speed = self.speedMulitplicator * self.countWheels
        print ("\(name) едет со скоростью \(speed)")
    }
    
    //Останавливает машину снижая ее мультипликатор скорости
    func stop() {
        guard checkIsAlive() else {return}
        self.speedMulitplicator = 0
        print ("Машина \(name) остановлена")
    }
    
    // Машину взорвали
    func explode() {
        guard checkIsAlive() else {return}
        self.isAlive = false
        print("Машина \(name) взорвана")
    }
    
}

let audi = Car(name: "Audi", countWheels: 4)
audi.speedMulitplicator = 50

audi.ride()
audi.stop()
audi.ride()
audi.explode()
audi.ride()


//Создайте Класс с учениками, в котором будет метод, который принимает структуру/класс учеников и сортирует их по оценкам и возвращает отсортированных учеников
struct Pupils {
    var name = String()
    var Score = Int()
}

var pupil1 = Pupils(name: "Ivan", Score: 80)
var pupil2 = Pupils(name: "Vitalya", Score: 99)
var pupil3 = Pupils(name: "Sam", Score: 97)
var pupil4 = Pupils(name: "Asko", Score: 60)

var pupilsArray:[Pupils] = []
pupilsArray.append(pupil1)
pupilsArray.append(pupil2)
pupilsArray.append(pupil3)
pupilsArray.append(pupil4) //длинновато получилось и тупо

class School {
    func studentSorting (pupils: [Pupils]) -> [Pupils] {
        var pupilsArray = pupils
        pupilsArray.sort(by: {$1.Score < $0.Score})
        return pupilsArray
    }
}
let school = School()
var sortedPupils = school.studentSorting(pupils: pupilsArray)

print(sortedPupils) //Какая-то фигня выводится перед каждым элементом __lldb_expr_103.

sortedPupils.forEach {pupil in
    print("\(pupil.name) \(pupil.Score)")
}

//Написать структуру или класс, и показать на примерах, чем отличается структура от класса

//1. Класс может унаследовать атрибуты и методы из другого класса в отличие от структуры
class LuxCar : Car {
    var price = Int()
}

//2. TypeCasting. Можем апкастить - делать экземпляр подкласса экземпляром мастер класса
let sharick = Dog(age: 2, name: "Sharick", size: .Big)
let sharickZver: Animal = sharick
sharickZver is Dog //Выдает true, потому что хранит все данные о экземпляре класса Dog, но обращаться к нему можно используя только штучки из суперкласса. Полиморфизм называется
//sharickZver.size не дает ничего, хотя где-то есть ссылка на этот атрибут объекта, если я правильно понял

// Можем так же даункастить, но лучше проверять что все выполняется успешно
if let sharickZverToDog = sharickZver as? Dog {
    print("Получилось преобразовать Шарика обратно в собаку")
} else {
    print("Шарик остался животным")
}
//Преобразование успешно

//Можем проверять тип экземпляра
if sharick is Animal {
    print("Шарик животное")
}
//Много всего про тайпкастинг есть, все не запомню без применения вообще

//3. Управление памятью. Структуры передают объекты по значению, а классы ссылками

class Class {
    var a: String
    init(a:String) { //В структуре инициализации значений экземпляра не требуется, она там есть по умолчанию
        self.a = a
    }
}
struct Struct {
    var a: String
}

var ClassEx = Class(a:"sd")
var StructEx = Struct(a: "sd")

var ClassEx1 = ClassEx
var StructEx1 = StructEx
ClassEx.a = "ssssssss"
StructEx.a = "ssssssss"

ClassEx1.a //- Мы получаем измененное значение из ClassEx.a потому что ClassEx1.a это ссылка на него
StructEx1.a //- Мы получаем значение, которое было в StructEx1.a, даже после того как мы изменили значение StructEx.a
