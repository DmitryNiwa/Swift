import UIKit

/*
 Создать 2 протокола:
 1.  "StartWriteCode" со свойствами: время, количество кода. И функцией writeCode()
 2. "EndWriteCode" с функцией: stopCoding()
 И класс: Разработчик, у которого есть свойства - количество программ написанных, специализация(ios, android, web может быть несколько). Разработчику подключаем два этих протокола.
 Задача: вывести в консоль сообщения - "Разработка началась. Пишем код" и "Работа закончена".
 */

protocol StartWriteCode {
    var timeHours: Int {get set}
    var codeLines: Int {get set}
    func writeCode ()
}

protocol EndWriteCode {
    func stopCoding ()
}

class Developer: StartWriteCode, EndWriteCode {
    var completedProgs: Int = 0 //Будем считать что каждая прога это 100 строк
    var specs: [String]
    var timeHours: Int
    var codeLines: Int
    var currentProgressLines: Int = 0
    var currentTime: Int = 0
    var activeFlag: Bool = false //используем чтобы понять, что разработчик продолжает писать код
    
    init(specs: [String], timeHours: Int, codeLines: Int) {
        self.specs = specs
        self.timeHours = timeHours
        self.codeLines = codeLines
    }
    
    
    func writeCode() {
        if activeFlag == false { //если флаг true, то значит разраб начинал писать код и не закончил, поэтому можно не предупреждать о начале работы
            print ("Разработка началась. Пишем код")
            activeFlag = true
        }
        self.currentProgressLines += self.codeLines
        while self.currentProgressLines > 100 {
            self.currentProgressLines -= 100
            completedProgs += 1
        }
        currentTime += self.timeHours
        
    }
    
    func stopCoding() {
        print("Работа закончена, ты проработал \(currentTime) часов")
        currentTime = 0
        activeFlag = false
    }
}

var dev = Developer(specs: ["ios"], timeHours: 2, codeLines: 230)
dev.writeCode()
dev.writeCode()
dev.writeCode()
dev.writeCode()
dev.completedProgs
dev.stopCoding()
dev.writeCode()
dev.writeCode()
dev.completedProgs
