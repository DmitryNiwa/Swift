import UIKit

//1

/*
 Наследование - это концепция в ООП, которая в языках программирования представлена в качестве наследования атрибутов и методов одного класса другим классом. Сепр класс - родительский, Саб класс - дочерний, Базовый класс - класс, не имеющий суперкласса. Множественного наследования от нескольких родительских классов в Свифте нет, но есть протоколы, но они могут только декларировать атрибуты и методы, но не полностью реализовывать
 
 Инкапсуляция - принцип в ООП, который в свифте представлен в виде ограничения доступа к атрибутам и методам в классах.
 private - вызываться атрибут или метод может только в рамках кода класса, не вызывается из экземпляров и дочерних классов
 public - вызывается отовсюду
 internal - вызывается в рамках модуля, кажется, у нас это скорее всего фреймворки?
 final - позволяют вызывать, но не переопределять
 fileprivate - доступен в рамках в файла, в котором был определен
 
 Полиморфизм - это принцип в ООП, который в свифте представлен в виде того, что объекты разных классов могут использовать один и тот же интерфейс (можно вызывать какой-нибудь общеназванный атрибут, несмотря на класс), при этом получая разные результаты. Короче как с переопределением атрибутов и методов.
 
 Все это конечно должно быть очень абстрактно, могу не понимать всю глубину -_-
 */


//2

//Создать класс "Люди", в этом классе 4 property - "имя", "рост", "вес", "пол", а также будет иметь метод "say", который будет что-то, свойственное человеку, говорить

class People {
    var name: String
    var height: Int
    var weight: Int
    var gender: String
    init(name: String, height: Int, weight: Int, gender: String) {
        self.name = name
        self.height = height
        self.weight = weight
        self.gender = gender
    }
    
    func say() {
        print("I'm a human, the smartest ass on the Earth")
    }
}


//Создать sub class (наследники) "повар", "менеджер", "борец" и переопределить метод "say(говорит)". Чтобы по разному говорило: "Менеджер говорит: ". Вот тут полиморфизм и наследование

class Cook: People {
    override func say() {
        print("I'm a cook")
    }
}

class Manager: People {
    override func say() {
        print("I'm a manager")
    }
}

class Grapler: People {
    override func say() {
        print("I'm a grapler")
    }
}

//Создать по одному объекту(экземпляру) каждого класса и объединить их в массив.

let cook = Cook(name: "Sam", height: 180, weight: 80, gender: "M")
let manager = Manager(name: "Bob", height: 190, weight: 86, gender: "M")
let grapler = Grapler(name: "Stella", height: 168, weight: 76, gender: "F")

var array:[People] = [cook, manager, grapler] //явно указал тип

//В цикле “for in” пройти по всем элементам массива и вывести в консоль все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "say(говорит)".
for i in array {
    print( i.name + ", рост \(i.height), вес \(i.weight), пол \(i.gender)")
    i.say()
}


//3
// Создать еще одного наследника от super Class, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам People.

class King: People {
    var coronationDate: String
    var networth: Int
    init(name: String, height: Int, weight: Int, gender: String, coronationDate: String, networth: Int) {
        self.coronationDate = coronationDate
        self.networth = networth
        super.init(name: name, height: height, weight: weight, gender: gender) //чето меня бесит по сто раз писать переинициализацию
    }
}
//Здесь приходится приводить тип к King, т.к. при итерациях по циклу мы не можем получить доступ к свойствам, которые доступны только в подклассе King
var king = King(name: "Emperor", height: 230, weight: 150, gender: "M", coronationDate: "2023-12-01", networth: 40000)
array.append(king)
for i in array {
    print( i.name + ", рост \(i.height), вес \(i.weight), пол \(i.gender)")
    if let king = i as? King { //вот тут это приведение
        print("+ дата коронации \(king.coronationDate), богатство \(king.networth)")
    }
    i.say()
}

//Метод "say(говорит)" реализовать таким образом, чтобы перед тем как выполнить собственный method say, выполнялся сначала метод say класса People.

class SubHuman: People {
    override func say() {
        super.say()
        print("Переопределил метод и скозал Класс")
    }
}

let subHuman = SubHuman(name: "Sok", height: 170, weight: 43, gender: "F")
subHuman.say()

//Вывести все это в обратном порядке (Google в помощь).
// вообще не понял что нужно вывести то


print("______4______")
//4
//Создать класс "Марсианин" (не наследник класса people!) со своими собственными property (отличными от people) и методом "say" (отличным от people).
class Alien {
    var code: String
    var god: String
    var age: Int
    init(code: String, god: String, age: Int) {
        self.code = code
        self.god = god
        self.age = age
    }
    
    func say() {
        print("ayyyyyy lmao")
    }
}

//Унаследоваться от него и создать пару других классов (Инопланетян) с переопределенным методом "say".

class Necron: Alien {
    init(code: String, age: Int) {
        super.init(code: code, god: "Necrontyr", age: age)
    }
    
    override func say() {
        print("Our people are awakening, and soon all of the galaxy shall be ours once more")
    }
}

let necron = Necron(code: "A2321", age: 38080)

class Eldar: Alien {
    init(code: String, age: Int) {
        super.init(code: code, god: "Elders", age: age)
    }
    
    override func say() {
        print("May the winds of fate guide my sword")
    }
}

let eldar = Eldar(code: "Ы1331", age: 39209)

//Объединить всех People и Марсианинов в один массив.

var mergedArray: [Any] = [cook, manager, grapler, king, necron, eldar] //если явно не указать [Any], то ошибка дурацкая

//В цикле выводить тип объекта (People или Марсианин), перед тем как выводить его свойства и вызывать метод
for i in mergedArray {
    if let people = i as? People {
        print("Это человек, со свойствами: Имя: \(people.name), рост: \(people.height), вес: \(people.weight), пол: \(people.gender)")
        people.say()
    } else if let alien = i as? Alien {
        print("Это чужой, с параметрами: Код: \(alien.code), возрастом \(alien.age), поклоняется богу \(alien.god)")
        alien.say()
    }
}

//5
print("_____5_____")

//Поместить всех people в один массив, а Марсиан в другой массив (количество People и Марсиан должно быть разное)
//У нас уже есть массив с людьми array

//массив с чужими
var arrayOfAlien = [necron, eldar]


//В одном цикле “for in” выводить People, а потом Марсианина, доставая данные поочередно из двух разных массивов, если в одном из массивов объектов больше, то в конце должны выводиться только объекты этого массива (так как других уже нет)

for i in 0...(max(array.count, arrayOfAlien.count) - 1) {
    if array.indices.contains(i) {
        print(array[i])
    }
    if arrayOfAlien.indices.contains(i) {
        print(arrayOfAlien[i])
    }
}
//хотел попользовать guard тут, но чето не получилось, он перескакивает на следующую итерацию после первого гварда
