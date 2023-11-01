import UIKit

typealias Element = String
let dictGenshin: [String: Element] = ["Xiao": "Anemo", "Jeane": "Anemo", "Griffith": "Anemo", "Xian": "Pyro", "Raiden": "Electro", "Tartaliya": "Hydro", "Bei": "Dendro", "Ayaka": "Cryo", "Albedo": "Geo"]
let dictDamage: [String: Int] = ["Sword": 1000, "Axe": 1300, "Halberd": 1450, "Knife": 600, "Morgenshtern": 1350, "Hummer": 1500]
var dictDefense: [String: Float] = ["Shield": 0.95, "Helmet": 0.78, "Armour": 0.9, "Sabatons": 0.4]
dictDefense.removeValue(forKey: "Sabatons")
let dictThousands: [Int: Int] = [1300: 1, 12003: 12, 39999: 39, 40000: 40]
let dictIsKonoha: [String: Bool] = ["Naruto": true, "Sasuke": true, "Orochimaru": false, "Sakura": true, "Gaara": false, "Temari": false, "Itachi": true]

//Словарь с названиями месяцев на русском
let dictMonthesRu: [Int: String] = [1: "Январь", 2: "Февраль", 3: "Март", 4: "Апрель", 5: "Май", 6: "Июнь", 7: "Июль", 8: "Август", 9: "Сентябрь", 10: "Октябрь", 11: "Ноябрь", 12: "Декабрь"]
dictMonthesRu[1]

//выводим в консоль
for key in dictMonthesRu.keys {
    print("\(key)-ый месяц - \(dictMonthesRu[key])")
}


//Словарь с названиями месяцев на английском
let dictMonthesEng: [Int: String] = [1: "January", 2: "February", 3: "March", 4: "April", 5: "May", 6: "June", 7: "July", 8: "August", 9: "September", 10: "October", 11: "November", 12: "December"]
dictMonthesEng[10]

//выводим в консоль
for (key,value) in dictMonthesEng {
    print("\(key)-ый месяц - \(value)")
}


//Грустно, что распечатывается в консоль не в том порядке, в котором лежат в словаре

//Создать пустой Dictionary и через условный оператор if проверьте пустой он или нет, если пустой то добавить в него пару любых значений
var dict: [String: Bool] = [:]

if dict.isEmpty {
    dict["Empty"] = false
    dict["FullOfCrack"] = true
    dict["SS"] = true
}
dict.updateValue(false, forKey: "FullOfCrack")
dict.removeValue(forKey: "SS")
print(dict)
