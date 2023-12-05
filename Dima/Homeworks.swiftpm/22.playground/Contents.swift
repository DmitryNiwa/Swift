import UIKit

// CoW - посмотрел, примерно понял, не для среднего ума уже, референсы разной силы нужно будет почитать, в видосах было такое давно, но как то не углублялся

//Реализовать структуру IOSCollection и создать в ней copy on write по типу - https://www.youtube.com/watch?v=QsoqHGgX2rE&t=594s

class Ref<T> { //в класс будем класть value из IOSCollection, чтобы хранить ссылку на это значение
    var value: T
    init(value: T) {
        self.value = value
    }
}

struct IOSCollection<T> {
    var ref: Ref<T>
    init(value: T) {
        self.ref = Ref(value: value) //инициализируем объект не самим value, а берем value и только ссылку на него
    }
    
    var value: T {
        get {
            ref.value //берем значение которое хранится по ссылке, ну типа мы брали ссылку на value, а теперь по этой ссылке смотрим что там лежит (а там value)
        }
        set { //про inout параметры и что это такое надо почитать
            guard isKnownUniquelyReferenced(&ref) else { //тут началось чето сложно, все ссылается по 100 раз в разные места
                ref = Ref(value: newValue) //если есть более одной сильной ссылки на объект, создаем еще один объект с новым значением
                return
            }
            ref.value = newValue //если сильная ссылка на этот участок памяти одна (как я понял, это значит, что всего одна переменная или экземпляр класса ссылается на него), то мы можем просто изменить это значение, не опасаясь что другая переменная будет заафекчена
        }
    }
}
//Схема довольно сложная для осмысления конечно

var colEl = IOSCollection(value: "Dima")
var colEl2 = colEl //должен ссылаться на тот же участок что и colEl??? да вроде нет, это же структуры просто хранят они экхемпляр класса Ref, которые ссылаются на один участок памяти
colEl.value
colEl2.value

colEl2.value = "Alex"//должен начать ссылаться на другой участок
colEl.value
colEl2.value

//чето затрудняюсь проверить что все сделано верно

withUnsafePointer(to: &colEl) {
    print("colEL \($0)")
}
withUnsafePointer(to: &colEl2) {
    print("colEl2 \($0)")
}
print(colEl.value)
withUnsafePointer(to: &colEl.value) {
    print($0) //0x000000016ddde758
}
print(colEl2.value)
withUnsafePointer(to: &colEl2.value) {
    print($0) //0x000000016ddde758
}
//вообще не понял почему имея разные значения colEl.value и colEl2.value ссылаются на один участок памяти




//Создать протокол Hotel с инициализатором который принимает roomCount, после создать class HotelAlfa добавить свойство roomCount и подписаться на этот протокол
protocol Hotel {
    var roomCount: Int {
        get set
    }
    init (roomCount: Int)
}

class HotelAlfa: Hotel {
    var roomCount: Int
    required init(roomCount: Int) { //required указывает на то, что у всех наследников этого класса должен быть реализован этот инициализатор, без этого ошибка, видимо из-за того что этот инициализатор происходит из протокола
        self.roomCount = roomCount
    }
}

var hotel1 = HotelAlfa(roomCount: 20)


//Создать protocol GameDice у него {get} свойство numberDice далее нужно расширить Int так чтобы, когда мы напишем такую конструкцию "let diceCoub = 4 \n diceCoub.numberDice" в консоле мы увидели такую строку - "Выпало 4 на кубике"
protocol GameDice {
    var numberDice: Int {
        get
    }
}

extension Int: GameDice {
    var numberDice: Int {
        get {
            print("на кубике выпало \(self)")
            return self
        }
    }
}
let diceCoub = 4
diceCoub.numberDice


//Создать протокол с одним методом и 2мя свойствами одно из них сделать явно optional, создать класс, подписать на протокол и реализовать только 1 обязательное свойство

protocol MyProtocol {
    var firstNum: Int { get }
    var optNum: Int? { get }
    func method()
}

extension MyProtocol { //расширяем протокол, и задаем дефолтное значение, чтобы в классе мы могли его не реализовывать
    var optNum: Int? {
        get { nil }
    }
}

class MyClass: MyProtocol {
    var firstNum: Int
    init(firstNum: Int) {
        self.firstNum = firstNum
    }
    
    func method() {
        print("haha")
    }
}

var classic = MyClass(firstNum: 6)
classic.optNum
