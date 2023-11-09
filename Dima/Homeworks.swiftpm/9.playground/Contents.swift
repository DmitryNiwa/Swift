import UIKit

//Создать 3 функции: 1 - которая ничего не принимает и ничего не возвращает. 2 - Принимает, но не возвращает. 3 - И принимает и возвращает = и все три вызвать потом. Что делают функции, выбери сам(а)

//Ничего не принимает и не возвращает
func DontEnter() {
    print("Тебе сюда нельзя")
}
DontEnter()

// Принимает, но не возвращает
func DontEnterBoy( _ name: String) {
    print("Тебе сюда нельзя \(name)")
}
DontEnterBoy("Степа")

//И принимает и возвращает
func HiMark(_ times: Int) -> String {
    var str:String = ""
    for _ in 1...times {
        str.append("Oh, Hi Mark\n")
    }
    return str
}
let IDidNotHitHer = HiMark(5)
print(IDidNotHitHer)

//Создать журнал для учителя, который будет принимать имя студента, профессию и оценку, затем будет записывать это все в массив. И внесите 10 студентов туда и распечатаете через цикл for

var Journal = [(String, String, UInt)]()

func AddStudent(info: (String, String, UInt)) {
    Journal.append(info)
}
AddStudent(info: ("Sinji", "Pilot", 80))
AddStudent(info: ("Asuka", "Pilot", 95))
AddStudent(info: ("Rei", "Pilot", 99))
AddStudent(info: ("Misato", "Pedo", 89))
AddStudent(info: ("Kaoru", "Angel", 999))
AddStudent(info: ("Redji", "Watermelon", 83))
AddStudent(info: ("Ritsuko", "Scientist", 100))
AddStudent(info: ("Kenske", "Student", 80))

for i in Journal {
    print("Name = \(i.0), Profession = \(i.1), Grade = \(i.2)")
}

//Создать функцию которая принимает имя и фамилию, и возвращает имя + фамилию в одной строке, потом пройтись по массиву с именем и фамилией и распечатать скрепленные имен и фамилия вместе в консоль
var spisok = ["Asuka", "Langley", "Rei", "Ayanami", "Shinji", "Ikari", "Kaoru", "Nagisa"]
func NameFamily(name: String, family: String) -> String {
    let str = name + " " + family
    return str
}
let a = spisok.count / 2 - 1
for i in 0...a {
    let str = NameFamily(name: spisok[i], family: spisok[i+1])
    spisok.append(str)
    spisok.remove(at:i)
}
for i in 0...a {
    spisok.remove(at: 0) //чето по другому не смог придумать как вычистить старые данные кроме как еще раз пройти по итерациям и убить первый элемент в каждой
}
print(spisok)

//Создайте функцию которая принимает параметры и вычисляет площадь круга
func SquareCircle(r: Double) -> Double {
    var S = Double()
    S = pow(r, 2) * Double.pi
    return S
}

SquareCircle(r: 1)

//Создайте Dictionary, с именем ученика(цы), где ключ name и score, а значение дата, когда человек получил такую оценку
// Трудно понять что требуется, смысл такого дневника, если получение одинаковой оценки по одному и тому же предмету будет перетирать предыдующую дату, мб лучше было бы сделать ключом дату, а значение все оценки которые он получил в эту дату

//var AsukaDict: [(name: String, score: Int): String] = [:]
//AsukaDict[("Math", 100)] = "23.03.2023"
//Так не работает

var AsukaDict: [String: String] = [:]
AsukaDict["Math, 100"] = "21/05/2023"
AsukaDict["Rus, 96"] = "22/06/2023"
AsukaDict["Rus, 95"] = "22/06/2023"


