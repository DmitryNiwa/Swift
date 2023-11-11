import UIKit

var greeting = "Hello, playground"

//Int
var int = 24

//String
var str = "string haha"

//UInt
var uint: UInt
uint = 18446744073709551615 //соответствует UInt64
var uint32 = UInt32.max
var uint64 = UInt64.max
uint = 0
///UInt32 vs UInt64
///UInt 32 соответствует переменной интеджер, которая занимает 32 бита памяти, соответственно закодировать можно числа от 0 до 2^32
///UInt 64 соответсвенно то же самое, но занимает 64 бита пасяти, кодируются числа от 0 до 2^64


//Bool
var boolValue: Bool
boolValue = true

//Float
var floatingNumber = Float.pi
//6 цифр после запятой

//Double
var doublingNumber = Double.pi
//15 цифр после запятой

//Попробуй ещё написать разные приведения типов
//Типа из Int в String, из Double в Int и тд. И посмотреть что будет выводиться после перевода из одного типа в другой
let strToInt = "203"
print(Int(strToInt)!) // Опциональное значение, т.к. не каждую строку можно перевести в Int

let doubleToInt = 230.1
print(Int(doubleToInt)) //Отбрасывается дробная часть


