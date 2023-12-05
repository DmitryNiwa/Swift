import UIKit


//Расширить String, чтобы мы могли получать целочисленное значение из строки (неопциональное (0, если не получилось преобразовать) и опциональное)

extension String {
    func getZValue () -> Int {
        if let a = Int(self) {
            return a
        } else {
            return 0
        }
    }
    
    func getOptionalZValue () -> Int? {
        return Int(self)
    }
}

var str = "12.4"
str.getZValue()
str.getOptionalZValue()

//Расширить Int и добавить 3 метода возведение в квадрат, куб, степень
extension Int {
    func sqr () -> Int { //ну тут легко выйти за пределы инта, наверное какой нибудь лонгинт лучше было бы отдавать
        return self * self
    }
    
    func triple () -> Int {
        return self.sqr() * self
    }
    
    func four () -> Int {
        return self.triple() * self
    }
}

let a:Int = 22
a.sqr()
a.triple()
a.four()

//Расширить еще 3 структуры на свой вкус так, чтобы появилось какое-то удобство у расширение. Например, extension string, которое делает все буквы в нем с маленькими
extension String {
    func getCoolNick() -> String { //Делает крутой ник для ICQ
        return "XxX_" + self + "_XxX"
    }
    
    func getNumberOfDigits() -> Int { //Получаем количество цифр в строке, с числами намного сложнее конечно, но вроде как то можно по пробелам разбить на слова и каждое слово чекать
        var sum = 0
        for i in self {
            if let digit = Int(String(i)) { //бред конечно String -> Character -> String -> Int
                sum += 1
            }
        }
        return sum
    }
}
"Dickson".getCoolNick()
"Апполон-2341234".getNumberOfDigits()
extension Double {
    func circleSquare () -> Double {//считает площадь круга с заданным радиусом
        return Double.pi * self * self
    }
}
23.0.circleSquare()


//Добавьте свойство (проперти), которое возвращает количество символов в числе
extension Int {
    var strLength:Int {
        get {
            String(self).count
        }
    }
}

a.strLength

//Добавить метод который говорит число положительное или отрицательное
extension Int {
    func isPositive () -> Bool {
        return self >= 0
    }
}

a.isPositive()
(-a).isPositive()
