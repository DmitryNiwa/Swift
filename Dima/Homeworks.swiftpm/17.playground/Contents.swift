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

struct Car {
    var carBrand: carBrands
    var year: Int
    var windowsIsOpen: Bool
    var engineIsRunning: Bool
    
    mutating func action (action: actions) {
        switch action {
        case .engine(let engineAction): //здесь я попытался сделать как советует chatGPT, но тоже хуйня. По итогу главная проблема в том, как достукиваться до вложенных значений в енамах
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
            self.windowsIsOpen = true
        case actions.windows.close :
            guard windowsIsOpen else {
                print("Windows are already closed")
            }
            self.windowsIsOpen = false
        default:
            print("This action is prohibited for a cars")
        }
    }
}

struct Truck {
    var carBrand: carBrands
    var year: Int
    var currentVolumeOfTruck: Double
    var maxVolumeOfTruck: Double
    var engineIsRunning: Bool
    
    mutating func engine (action: actions.engine) {
        switch action {
        case actions.engine.turnOn:
            guard !engineIsRunning else {
                print("Engine is already turned on")
                return
            }
            self.engineIsRunning = true
        case actions.engine.turnOff:
            guard engineIsRunning else {
                print("Engine is already turned off")
                return
            }
            self.engineIsRunning = false
        }
    }
    //много проверок я опускаю, неужели вы всегда их пишете для пользовательских полей? Например, чтобы он в volume груза не пихнул отрицательное число, это же ппц сколько всего
    
    mutating func load (action: actions.volume, volume: Double) {
        switch action {
        case actions.volume.load:
            if (self.currentVolumeOfTruck + volume) <= maxVolumeOfTruck {
                self.currentVolumeOfTruck += volume
            } else if (self.currentVolumeOfTruck + volume) > maxVolumeOfTruck {
                print("Cargo doesn't fit into truck")
            } else {
                print("Unknown issue")
            }
        case action.volume.unload:
            if (self.currentVolumeOfTruck - volume) < 0 {
                print("There is nothing to unload")
            } else if (self.currentVolumeOfTruck - volume) >= 0 {
                self.currentVolumeOfTruck -= volume
            } else {
                print("Uknown issue")
            }
        }
    }
}

//Описать перечисление с возможными действиями с автомобилем: запустить/заглушить, двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum actions {
    enum engine {
        case turnOn
        case turnOff
    }
    enum volume {
        case load
        case unload
    }
    enum windows {
        case open
        case close
    }
}

//Добавить в структуры метод с одним аргументом типа enum, который будет менять свойства структуры в зависимости от действия (То есть будут меняться состояния машины: едет (значит двигатель запущен), стоит на месте, и тд).

