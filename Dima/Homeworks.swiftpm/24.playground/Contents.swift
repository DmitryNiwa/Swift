import UIKit

//Попробовать сдекодить модельку (структуру) в json (с вложенными структурами). Распечать это в консоль

struct Person: Codable {
    var name: String
    var age: Int
    var gender: String
    var alive: Bool
}

let papich = Person(name: "Arthas", age: 33, gender: "M", alive: true)
let encoder = JSONEncoder()

do { //тут ознакомился с do...catch
    let jsonPapich = try encoder.encode(papich) //if let тут не получилось, результат encode не является опциональным типом
    let stringJsonPapich = String(data: jsonPapich, encoding: .utf8)!
    print(stringJsonPapich) //без преобразования в строку выводит вес джсона походу
} catch {
    print("Не получилось, ошибка /(error)")
}

//Попробовать декодировать модельку из json в структуру
let jsonPapich = encoder.encode(papich)
let decoder = JSONDecoder()

let revertPapich = try decoder.decode(Person.self, from: jsonPapich) // на первом месте указываем тип, на втором файл из которого конвертируем

// Создадим структуру со вложенной структурой, закодируем и задекодим
struct VideoFile: Codable {
    var fileUrl: String
    var lang: String
    var quality: String
}

struct Video: Codable {
    var name: String
    var year: Int
    var file: VideoFile
}

var harryPotter = Video(name: "Harry Potter", year: 2002, file: VideoFile(fileUrl: "t.me", lang: "ru", quality: "HD1080"))

do {
    let jsonHarryPotter = try encoder.encode(harryPotter)
    let stringHP = String(data:jsonHarryPotter, encoding: .utf8)
    print(stringHP!)
} catch {
    print("/(error)")
}
let jsonHarryPotter = try encoder.encode(harryPotter)
let stringHP = String(data:jsonHarryPotter, encoding: .utf8)
//Попробуем перевести String в Data
if let dataFromString = stringHP!.data(using: .utf8) {
    var harryPotterRevert: Video = decoder.decode(Video.self, from: dataFromString)
} else {
    print("Не удалось")
}

