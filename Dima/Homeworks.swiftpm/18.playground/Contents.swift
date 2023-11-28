import UIKit

//Сделать класс Люди, у класса будут свойства (проперти) родственники, соседи и тд (всё опционально). Будем делать упрощенную схему, где у братьев и сестер могут быть только одинаковые родители, у всех есть два родителя
var allObj:[Any] = []
protocol naming {
    var name:String {get set}
}
class Human:naming {
    var name: String
    var gender: String
    var parents: [Human]? = [] //  Почему если не писать = [], то работать не будет, через append не добавляются родтсвениики (Разобрался, что при инициализаии опционального значения ему по умолчанию присваивается nil
    var children: [Human]? = []
    var neighbors: [Human]? = []
    var siblings: [Human]? {
        get {
            if var siblings =  self.parents?[0].children {
                siblings.removeAll {$0 === self}
                return siblings
            } else {
                return nil
            }
        }
    }
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
        allObj.append(self)
    }
    
    func addParent(parent: Human) {
        self.parents?.append(parent)
        parent.children?.append(self)
    }
    func addChildren(child: Human) {
        self.children?.append(child)
        child.parents?.append(self)
    }
    func addNeighor(neighbor: Human) {
        self.neighbors?.append(neighbor)
        neighbor.neighbors?.append(self)
    }
}

//Создать нужно более 25 человек
//названия даны по мере того, как разрасталось дерево

var sam = Human(name: "Sam", gender: "M")
var johnSamParent = Human(name: "John", gender: "M")
var jeaneSamParent = Human(name: "Jeane", gender: "F")
var lisaJohnJeaneChildren = Human(name: "Lisa", gender: "F")
var maraJohnJeaneChildren = Human(name: "Mara", gender: "F")
var borisJohnJeaneChildren = Human(name: "Boris", gender: "M")
var frankJohnJeaneChildren = Human(name: "Frank", gender: "F")

var adamJohnParent = Human(name: "Adam", gender: "M")
var moraJohnParent = Human(name: "Mora", gender: "F")
var genaAdamMoraChildren = Human(name: "Gena", gender: "M")
var laraAdamMoraChildren = Human(name: "Lara", gender: "F")
var svenAdamMoraChildren = Human(name: "Sven", gender: "M")

var annaSvenAliceChildren = Human(name: "Anna", gender: "F")
var pianSvenAliceChildren = Human(name: "Pian", gender: "F")
var anyaSvenAliceChildren = Human(name: "Anya", gender: "F")
var aliceAnnaParent = Human(name: "Alice", gender: "F")

//возвращаемся к jeane маме Сэма
var samJeaneParent = Human(name: "Sam", gender: "M")
var vilaJeaneParent = Human(name: "Vila", gender: "F")
var jackVilaSamChildren = Human(name: "Jack", gender: "M")
var tanyaVilaSamChildren = Human(name: "Tanya", gender: "F")
var svetaVilaSamChildren = Human(name: "Sveta", gender: "F")
var kateVilaSamChildren = Human(name: "kate", gender: "F")

var stanSamNeighbor = Human(name: "Stan", gender: "M")


//назначаем всем роли
sam.addParent(parent: johnSamParent)
sam.addParent(parent: jeaneSamParent)
johnSamParent.addChildren(child: lisaJohnJeaneChildren)
jeaneSamParent.addChildren(child: lisaJohnJeaneChildren)
johnSamParent.addChildren(child: maraJohnJeaneChildren)
jeaneSamParent.addChildren(child: maraJohnJeaneChildren)
johnSamParent.addChildren(child: borisJohnJeaneChildren)
jeaneSamParent.addChildren(child: borisJohnJeaneChildren)
johnSamParent.addChildren(child: frankJohnJeaneChildren)
jeaneSamParent.addChildren(child: frankJohnJeaneChildren)

johnSamParent.addParent(parent: adamJohnParent)
johnSamParent.addParent(parent: moraJohnParent)
adamJohnParent.addChildren(child: genaAdamMoraChildren)
moraJohnParent.addChildren(child: genaAdamMoraChildren)
adamJohnParent.addChildren(child: laraAdamMoraChildren)
moraJohnParent.addChildren(child: laraAdamMoraChildren)
adamJohnParent.addChildren(child: svenAdamMoraChildren)
moraJohnParent.addChildren(child: svenAdamMoraChildren)

aliceAnnaParent.addChildren(child: annaSvenAliceChildren)
svenAdamMoraChildren.addChildren(child: annaSvenAliceChildren)
aliceAnnaParent.addChildren(child: pianSvenAliceChildren)
svenAdamMoraChildren.addChildren(child: pianSvenAliceChildren)
aliceAnnaParent.addChildren(child: anyaSvenAliceChildren)
svenAdamMoraChildren.addChildren(child: anyaSvenAliceChildren)

jeaneSamParent.addParent(parent: samJeaneParent)
jeaneSamParent.addParent(parent: vilaJeaneParent)
samJeaneParent.addChildren(child: jackVilaSamChildren)
vilaJeaneParent.addChildren(child: jackVilaSamChildren)
samJeaneParent.addChildren(child: tanyaVilaSamChildren)
vilaJeaneParent.addChildren(child: tanyaVilaSamChildren)
samJeaneParent.addChildren(child: svetaVilaSamChildren)
vilaJeaneParent.addChildren(child: svetaVilaSamChildren)
samJeaneParent.addChildren(child: kateVilaSamChildren)
vilaJeaneParent.addChildren(child: kateVilaSamChildren)

sam.addNeighor(neighbor: stanSamNeighbor)
sam.addNeighor(neighbor: samJeaneParent)
sam.addNeighor(neighbor: vilaJeaneParent)

//Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь
//Братья

/* Это попытка сделать более сложную модель, если честно не очень получилось. Здесь была попытка обработать случаи, когда мы ищем братьев для sam, но при этом учитывая, что у родителей могут быть дети от других людей
var johnBrothers: Int = 0 //Я не понимаю, почему если здесь не сделать =0, то на 120 строчке будет ошибка, что переменная используется до инициализации
if let johnChildren = sam.parents?[0].children, let jeaneChildren = sam.parents?[1].children {
    var johnJeaneCommonChildren = johnChildren.filter { child in
        jeaneChildren.contains{ $0 === child } // я вообще запутался, че за ===(Прочитал осознал)
    } //Ищем общих детей по такой схеме, потому что могут быть дети не от обоих родителей
    johnJeaneCommonChildren.removeAll{ $0 === sam} //удаляем самого Сэма
    johnBrothers = johnJeaneCommonChildren.filter {
        $0.gender == "M" //ищем братьев
    }.count
}
johnBrothers
*/

sam.siblings?.filter {$0.gender == "M"} //нашли братьев Сэма, можем посчитать через count
sam.siblings?.filter {$0.gender == "F"} // сестры

// Тети
var aunties: [Human] = []
for parent in sam.parents! {
    if let parentSiblings = parent.siblings {
        aunties += parentSiblings.filter {$0.gender == "F"}
    }
}
//Дяди тоже самое, но через с гендером M
for i in aunties {
    print(i.name + " Тётя")
}

//Двоюродные
var cousins: [Human] = []
for parent in sam.parents! {
    if let parentSiblings = parent.siblings {
        for parentSibs in parentSiblings {
            if let parentSiblingsChildren = parentSibs.children {
                cousins += parentSiblingsChildren
            }
        }
    }
}

for i in cousins {
    print(i.name + " кузины")
}


//Создать класс животных и свойства (проперти) - корова, коза, собака и тд
class Animal:naming {
    var name:String
    var legs:Int
    init(name: String, legs: Int) {
        self.name = name
        self.legs = legs
        allObj.append(self)
    }
}

let dog = Animal(name: "Sharik", legs: 4)
let cow = Animal(name: "Dunya", legs: 3)
let goat = Animal(name: "Murka", legs: 4)
let cat = Animal(name: "Matroskin", legs: 2)

//Создать класс растения и проперти - трава, цветы и тд
class Plants:naming {
    var name: String
    var height: Int
    init(name: String, height: Int) {
        self.name = name
        self.height = height
        allObj.append(self)
    }
}

let flower = Plants(name: "Tsvetochek", height: 30)
let oaken = Plants(name: "Dubochek", height: 500)
let grass = Plants(name: "Travushka-muravushka", height: 20)
let treant = Plants(name: "Trentochek Protectorochek", height: 700)


//Положить их всех в массив и отсортировать по алфавиту и по классу - люди - животные - растения
allObj // получили массив со всеми объектами, созданными в этой домашке

allObj.sort { (i: Any, j: Any)  -> Bool in
    /* Это могло быть красиво, но я хз как добиться чтобы у типа Any можно было обратиться к name
    if type(of: i) == type(of: j) {
        return i.name > j.name
     */
    if let i = i as? Plants, let j = j as? Plants {
        return i.name > j.name
    } else if let i = i as? Animal, let j = j as? Animal {
        return i.name > j.name
    } else if let i = i as? Human, let j = j as? Human {
        return i.name > j.name
    } else if i is Plants && (j is Animal || j is Human)  {
        return true
    } else if i is Animal && j is Plants {
        return false
    } else if i is Human && (j is Animal || j is Human) {
        return false
    } else if i is Animal && j is Human {
        return true
    } else {
        return false //добавил это потому что компилятор говорил, что какие-то случаи не учтены, но я не понимаю какие, если менять на true разницы нет
    }
}
//Отвратительно выглядит, но я так и не придумал как сделать лучше(
for i in allObj {
    if let i = i as? Human {
        print(i.name)
    } else if let i = i as? Plants {
        print(i.name)
    } else if let i = i as? Animal {
        print(i.name)
    }
}
