import UIKit

var Names = ["Asuka", "Shinji", "Sasuke", "Tom", "A", "DanteAligeri", "Sam", "Alex", "Goldfarb"]

//Написать сортировку массива с помощью замыкания, сначала по возрастанию, затем по убыванию. Вывести всё в консоль.
print(Names.sorted(by: <))
print(Names.sorted(by: { $0 > $1} ))

//Выбирает только четный значение
var Numbers = [2, 1, 4, 3, 6, 5, 9, 8 ,7]
print(Numbers.filter { $0 % 2 == 0})

//Создать метод который запрашивает имена друзей, после этого имена ложит в массив, сортирует этот массив по количеству букв в имени и возвращает результат - отсортированный массив


func FriendsArray (_ friendName1: String, _ friendName2: String, _ friendName3: String) -> [String] {
    var friendArray = [String]()
    friendArray = [friendName1, friendName2, friendName3]
    return friendArray.sorted(by: { $0.count < $1.count })
}

let friends = FriendsArray("Kim Katsuragi", "Tomas Shelby", "Rick Lee")
print(friends)

func FriendsArrayRead () -> [String] {
    var FriendArray = [String]()
    while true {
        print("Введи имя друга")
        if let FriendName = readLine(), !FriendName.isEmpty { // Как я понял чтение с инпута не работает в плейграунде
            FriendArray.append(FriendName)
        } else {
            break
        }
    }
    return FriendArray.sorted(by: { $0.count < $1.count })
}

FriendsArrayRead()


//Написать функцию, которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами
func Dict(_ MyKeys: [String]) -> [String:Int] {
    var MyDict = [String:Int]()
    for i in MyKeys {
        MyDict[i] = i.count
    }
    return MyDict
}

print(Dict(["Helo", "World", "Avada Kedavra", ""]))


//Написать функцию, которая принимает пустые массивы(один - строковый, второй - числовой) и проверяет их: если пустой - то добавить значения (любые) и вывести в консоль.

func EmptyArraysFulfilling(StringArray: [String], NumberArray: [Int]) {
    var StringArrayPrivate = StringArray
    var NumberArrayPrivate = NumberArray
    if !StringArray.isEmpty && !NumberArray.isEmpty {
        print("Для этой функции подходят только пустые массивы")
        return //Прерывем выполнение функции после вывода информации
    } else if StringArray.isEmpty && NumberArray.isEmpty {
        for i in 1...Int.random(in: 1...10){
            StringArrayPrivate.append("Число \(i)")
            NumberArrayPrivate.append(Int.random(in: 1..<100))
        }
    } else if StringArray.isEmpty {
        for i in 1...Int.random(in: 1...10){
            StringArrayPrivate.append("Число \(i)")
        }
    } else if NumberArray.isEmpty {
        for _ in 1...Int.random(in: 1...10){
            NumberArrayPrivate.append(Int.random(in: 1..<100))
        }
    }
    print(StringArrayPrivate)
    print(NumberArrayPrivate)
}

EmptyArraysFulfilling(StringArray: [], NumberArray: [1])
