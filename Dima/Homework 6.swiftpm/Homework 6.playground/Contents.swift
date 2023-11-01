import UIKit


//Создаем 5 тюплов
let MonthRuTuple = ("Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь")
let MonthEngTuple = ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
let Saber = (SpiritClass: "Saber", Name: "Artoria", Height: 155, isSpirit: true, Sex: "female", MasterName: "Sinji" )
Saber.SpiritClass

let Eva01 = (Pilot: "Sinji", isAngel: false, Damage: 1200.0, HP: 100, 1)
Eva01.0

let ErrorTuple = (304, "Not Modified")
ErrorTuple.1

// Распечатать тюпл тремя различными способами, тут затык, то что я написал кажется слишком тупо

// Первый
print(Saber)

//Второй
print((ErrorTuple.0, ErrorTuple.1))

//Третий
print((Saber.Height, Saber.MasterName, Saber.Name, Saber.Sex, Saber.SpiritClass, Saber.isSpirit))

let count = Mirror(reflecting: Saber).children.count
let dict = [1: "one", 2: "two", 3: "three"]
print(Mirror(reflecting: dict).description) //слабо понял пока для чего этот Mirror нужен
Mirror(reflecting: ErrorTuple).children.count

