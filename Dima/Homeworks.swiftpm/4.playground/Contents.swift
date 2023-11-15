import UIKit

let ConstArray = ["a", "b", "c", "d"]
var array = [String]()
//print(ConstArray[1...3])
array.insert("0", at: 0)
//print(array)

let MoneyArray: [Int] = [100, 100, 50, 20, 50, 10, 1, 20, 100, 50, 50, 1, 1, 1, 10, -110]



//Функция считает общую сумму денег, которые записаны в массив
func MoneySum(Array: [Int]) -> Int {
    var sum: Int = 0
    for i in Array {
        if i > 0 {
            sum += i
        }
    }
    return sum
}

var AllMoney = MoneySum(Array: MoneyArray)



// Выводим количество дней в каждом месяце
let DaysInMonthes: [Int] = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
for i in DaysInMonthes {
    print(i)
}
let MonthesNames: [String] = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
let n = DaysInMonthes.count - 1


//Выводим название месяца и количество дней в нем
for i in (0...n) {
    print("\(MonthesNames[i]) - \(DaysInMonthes[i])")
}



//Делаем тоже самое с помощью массива тюплов
//Для начала создадим массив тюплов
var TupleArray: [(month: String, days: Int)] = []
for i in (0...n) {
    TupleArray.append((month: MonthesNames[i], days: DaysInMonthes[i]))
}
//Теперь печатаем
for i in (0...n) {
    print("\(TupleArray[i].0) - \(TupleArray[i].1)")
}




//Теперь выведем это в обратном порядке
for i in (0...n) {
    print("\(TupleArray[n - i].0) - \(TupleArray[n - i].1)")
}

//Со звездочкой. Для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года

// Сделаем функция, где вводим дату в формате 1 1 - первое января + считаем что с начала года до 1 января прошел 1 день
func DaysFromNewYear(month: Int, day: Int) -> Int {
    var SumOfDayInMonthes: Int = 0
    let OriginalMonth = month - 1
    if (month > 0) && (month <= 12) && (day > 0) && (day <= 31) {
        for i in (0...OriginalMonth) {
            SumOfDayInMonthes += DaysInMonthes[i]
        }
        SumOfDayInMonthes -= (DaysInMonthes[month - 1] - day)
    }
    else {
        print("Ошибка ввода")
    }
    return SumOfDayInMonthes
}

DaysFromNewYear(month: 4, day: 15) //105 дней, проверено, найс
DaysFromNewYear(month: 13, day: 15) // ошибка ввода, найс



//А давай сделаем enum по месяцам
//и функцию, которая будет получать эту enum и отдавать количество дней

enum months {
    case january, february, march, april, may, june, july, august, september, october, november, december
}
let august = months.august
func HowManyDaysInMonth (enumMonth: months) -> String {
    var days = String()
    switch enumMonth {
    case .january, .march, .may, .july, .august, .october, .december:
        days = "31 день"
    case .february:
        days = "28 дней"
    case .april, .june, .september, .november:
        days = "30 дней"
    }
    return "В этом месяце " + days
}
print (HowManyDaysInMonth(enumMonth: august))
