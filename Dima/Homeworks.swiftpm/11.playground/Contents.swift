import UIKit

/*
 enum ИмяПеречисления {
    список через case
 }
 */

var dictionary: Dictionary <String, Double>

//Создайте по 1-2 enum разных типов. Можно брать примеры из жизни. Тип дня .day, .night
enum SpiritClass {
    case Archer, Saber, Berserker, Caster, Rider, Assasin, Lancer
}
let Artoria: SpiritClass
Artoria = .Saber
let Zhieldere = SpiritClass.Caster

enum Weapon {
    case sword
    case halberd
    case bow
    enum axe {
        case big
        case normal
    }
}
let BigSwordSize = Weapon.axe.big

enum WorkerProfession {
    case lawer
    case doctor
    enum engineer {
        case info, mech, bio
    }
    case support
}

//Создать enum со всеми цветами радуги

enum Rainbow {
    case red, orange, yellow, green, lightBlue, blue, purple
}

//Создать enum оценок, а затем функцию, которая будет принимать этот enum и печатать в консоль какую оценку получил ученик
enum Grade {
    case A, B, C, D, F
}

func GradePrinter(_ grade: Grade) {
    var text = String()
    switch grade {
    case .A:
        text = "Excellent"
    case .B:
        text = "Good"
    case .C:
        text = "Not bad"
    case .D:
        text = "Bad"
    case .F:
        text = "Fail"
    }
    print(text)
}

let GradeOfPupil1 = Grade.F
GradePrinter(GradeOfPupil1)

//Создать программу, которая "рассказывает" - бренды автомобилей стоят в гараже

enum CarBrands: CaseIterable {
    case bmw, mercedes, lamborgini, ferrari, fiat, lada, skoda
}
CarBrands.allCases.count

let MyCars:[CarBrands] = [.bmw, .mercedes, .ferrari, .ferrari, .lada]

func TellMeAboutCars (_ cars: [CarBrands]) {
    for i in cars {
        switch i {
        case .bmw:
            print("BMW")
        case .mercedes:
            print("Mercedes")
        case .lamborgini:
            print("Lambo")
        case .ferrari:
            print("Ferrari")
        case .fiat:
            print("Fiat")
        case .lada:
            print("Lada")
        case .skoda:
            print("Skoda")
        }
    }
}

TellMeAboutCars(MyCars)
