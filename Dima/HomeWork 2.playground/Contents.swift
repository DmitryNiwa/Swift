import UIKit

// second hw

typealias HP = Float
var HP1: HP = 100
var HP2: HP = 120

typealias Attack = Float
var Attack1, Attack2: Attack //Примем, что attack1 - это сила атаки с которой бахнули по 1 игроку
Attack1 = 120
Attack2 = 350


typealias Defend = Float
var Defend1, Defend2: Defend
Defend1 = 40
Defend2 = 50


func hit(hp: HP, attack: Attack, defend: Defend) -> HP {
    let damage = HP(defend) / 100 * HP(attack)
    return damage
}
var Hit1: HP
Hit1 = hit(hp: HP1, attack: Attack1, defend: Defend1) //бахнули на 48 хп, хорошо!

//Функция для решения квадратного уравнения
func SquareEquation(a: Double, b: Double, c: Double) -> (x1: Double?, x2: Double?) {
    let d = pow(b, 2) - 4 * a * c
    var x1, x2: Double?
    if d > 0 {
        x1 = ((-b) + sqrt(d)) / (2 * a)
        x2 = ((-b) - sqrt(d)) / (2 * a)
        print ("x1 = " + String(x1 ?? 0.0000001) + ", " + "x2 = " + String(x2 ?? 22312312312)) //Как в Double запихнуть "error" я не нашел, но и не сильно искал
    }
    else if d == 0 {
        x1 = (-b) / (2 * a)
        x2 = nil
        print ("x = " + String(x1 ?? 0.0000001)) //Аналогично, "error" хз как пихнуть
    }
    else if d < 0 {
        x1 = nil
        x2 = nil
        print ("There is no solution")
    }
    return(x1: x1, x2: x2)
}
    var Solution = SquareEquation(a: 1, b: 0, c: -4) //Решили уравнение, красота

//Площадь треугольника по формуле Герона
let a = 2.0
let b = 4.0
let c = 5.0
var p = a + b + c
var STriangle: Double = sqrt(p * (p - a) * (p - b) * (p - c))

// Площадь квадрата со стороной а
var SSquare = pow(a, 2)


