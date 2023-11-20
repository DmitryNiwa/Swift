import UIKit


//Описать несколько структур – любой легковой автомобиль и любой грузовик
//Структуры должны содержать марку авто (можно через enum 5-6 марок автомобилей сделать), год выпуска, объем багажника / кузова, запущен ли двигатель

enum сarBrands {
    case mercedes
    case audi
    case volktswagen
    case skoda
    case renault
}

enum EngineAction {
    case turnOn
    case turnOff
}

enum WindowAction {
    case open
    case close
}

enum VolumeAction{
    case load
    case unload
}

enum ActionType {
    case engineAction(EngineAction)
    case windowAction(WindowAction)
    case volumeAction(VolumeAction)
}

struct Car {
    var carBrand: сarBrands
    var year: Int
    var windowsIsOpen: Bool
    var engineIsRunning: Bool
    
    mutating func action (action: ActionType) {
        switch action {
        case .engineAction(let engineAction):
            switch engineAction {
            case .turnOn:
                guard !engineIsRunning else {
                    print("Engine is already turned on")
                    return
                }
                self.engineIsRunning = true
            case .turnOff:
                guard engineIsRunning else {
                    print("Engine is already turned off")
                    return
                }
                self.engineIsRunning = false
            }
        case .windowAction(let windowAction):
            switch windowAction {
            case .open:
                guard !windowsIsOpen else {
                    print("Windows are already opened")
                    return
                }
                self.windowsIsOpen = true
            case .close:
                guard windowsIsOpen else {
                    print("Windows are already closed")
                    return
                }
                self.windowsIsOpen = false
            }
        default:
            print("This action is prohibited for a cars")
        }
    }
}

struct Truck {
    var carBrand: сarBrands
    var year: Int
    var currentVolumeOfTruck: Double
    var maxVolumeOfTruck: Double
    var engineIsRunning: Bool
    
    mutating func action (action: ActionType) {
        switch action {
        case .engineAction(let engineAction):
            switch engineAction {
            case .turnOn:
                guard !engineIsRunning else {
                    print("Engine is already turned on")
                    return
                }
                self.engineIsRunning = true
            case .turnOff:
                guard engineIsRunning else {
                    print("Engine is already turned off")
                    return
                }
                self.engineIsRunning = false
            }
        default:
            print("This function only for engine. Your action can't be performed")
        }
    }
    //много проверок я опускаю, неужели вы всегда их пишете для пользовательских полей? Например, чтобы он в volume груза не пихнул отрицательное число, это же ппц сколько всего
    
    mutating func load (action: ActionType, volume: Double) {
        switch action {
        case .volumeAction(let volumeAction):
            switch volumeAction {
            case .load:
                if (self.currentVolumeOfTruck + volume) <= maxVolumeOfTruck {
                    self.currentVolumeOfTruck += volume
                } else if (self.currentVolumeOfTruck + volume) > maxVolumeOfTruck {
                    print("Cargo doesn't fit into truck")
                } else {
                    print("Unknown issue")
                }
            case .unload:
                if (self.currentVolumeOfTruck - volume) < 0 {
                    print("There is nothing to unload")
                } else if (self.currentVolumeOfTruck - volume) >= 0 {
                    self.currentVolumeOfTruck -= volume
                } else {
                    print("Uknown issue")
                }
            }
        default:
            print("This function only for a luggage. Your action can't be performed")
        }
    }
}

//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить, двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//Сделано 3 enum с действиями с конкетными органами машины, и еще один енам который их объеденяет ActionType



//Добавить в структуры метод с одним аргументом типа enum, который будет менять свойства структуры в зависимости от действия (То есть будут меняться состояния машины: едет (значит двигатель запущен), стоит на месте, и тд).

var myAudi = Car(carBrand: .audi, year: 1998, windowsIsOpen: false, engineIsRunning: false)
myAudi.action(action: .engineAction(.turnOn))
myAudi.engineIsRunning
myAudi.action(action: .engineAction(.turnOn))
var mySkoda = Car(carBrand: .skoda, year: 2023, windowsIsOpen: true, engineIsRunning: false)
var MyRenault = Car(carBrand: .renault, year: 2022, windowsIsOpen: false, engineIsRunning: true)

var myMercTruck = Truck(carBrand: .mercedes, year: 2009, currentVolumeOfTruck: 0, maxVolumeOfTruck: 1000, engineIsRunning: true)
myMercTruck.load(action: .volumeAction(.load), volume: 23)
myMercTruck.currentVolumeOfTruck
myMercTruck.load(action: .volumeAction(.load), volume: 12000)
var myAudiTruck = Truck(carBrand: .audi, year: 2019, currentVolumeOfTruck: 0, maxVolumeOfTruck: 10020, engineIsRunning: false)


//Положить объекты структур в словарь, как ключи, а их названия как строки например
//var dict = [structCar: "structCar"]

//Тк структуры не являются хешируемыми, то их нужно сделать таковыми (без этого ошибка)

extension Car:Hashable {
    static func == (oneCar: Car, secondCar: Car) -> Bool { //будем считать, что не бывает в нашем гараже машин с одинаковым годом выпуска и с одинаковым брендом, здесь делаем функцию, по которой будем определять равенство обхектов структуры и их хеша
        return (oneCar.carBrand == secondCar.carBrand) && (oneCar.year == secondCar.year)
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(carBrand)
        hasher.combine(year)
    }
}

extension Truck:Hashable {
    static func == (oneTruck: Truck, secondTruck: Truck) -> Bool {
        return ((oneTruck.carBrand == secondTruck.carBrand) && (oneTruck.year == secondTruck.year)) && (oneTruck.maxVolumeOfTruck == secondTruck.maxVolumeOfTruck)
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(carBrand)
        hasher.combine(year)
        hasher.combine(maxVolumeOfTruck)
    }
}

//В один словарь у меня не получилось запихнуть, потому что Any тип не хешируемый
var carDict: [Car: String] = [myAudi: "myAudi", mySkoda: "mySkoda", MyRenault: "myRenault"]
var truckDict: [Truck: String] = [myMercTruck: "myMercTruck", myAudiTruck: "myAudiTruck"]



