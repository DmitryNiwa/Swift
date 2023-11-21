import UIKit

//Сделать класс Люди, у класса будут свойства (проперти) родственники, соседи и тд (всё опционально).

class Human {
    var name: String
    var gender: String
    var parents: [Human]? = [] //  Почему если не писать = [], то работать не будет, через append не добавляются родтсвениики
    var siblings: [Human]? = []
    var children: [Human]? = []
    var neighbors: [Human]? = []
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
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

// Тети

