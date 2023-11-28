import UIKit

//Сделать библиотеку книг и видео библиотеку фильмов
enum Mood: Int {//добавил, чтобы можно было сортировать
    case fun = 10 //приоритет
    case ropemaxxing = 9
    case retroshort = 8
    case jewmaxxing = 7
    case retrolong = 6
}

var books: [Book] = []
class Book {
    var name: String
    var author: String
    var year: Int
    init(name: String, author: String, year: Int) {
        self.name = name
        self.author = author
        self.year = year
    }
    var mood: Mood? {
        get {
            if self.name == "Adolf Hitler" {
                return Mood.jewmaxxing
            } else if self.year >= 2022 {
                return Mood.ropemaxxing
            } else if self.year >= 2000 && self.year <= 2022 {
                return Mood.fun
            } else if self.year < 2000 && self.name.count <= 10 {
                return Mood.retroshort
            } else if self.year < 2000 && self.name.count > 10 {
                return Mood.retrolong
            } else {
                print("Книгу невозможно распределить")
                return nil
            }
        }
    }
    //Возможность добавлять новые книги и фильмы, после добавления должна происходить автоматическая сортировка по алфавиту
    func addBook () { //я бы лучше запихнул это сразу в init(((
        let book = self
        books.append(book)
        books.sort { $0.name < $1.name }
    }
    
    static func sortByMood() {
        books.sort {
            $0.mood?.rawValue ?? 0 < $1.mood?.rawValue ?? 0 //rawValue здесь используем чтобы получить доступ к Int присвоенным каждому кейсу (приоритету), не совсем понял почему здесь нужно задавать дефолтное значение, это из-за опциональности mood?
        }
    }
}




//Фильмы
enum Genres {
    case drama, horror, documentary, historic, fantasy
}
var movies:[Movie] = []
class Movie {
    var name: String
    var artist: String
    var genre: Genres
    init(name: String, artist: String, genre: Genres) {
        self.name = name
        self.artist = artist
        self.genre = genre
    }
    
    func addMovie () {
        let movie = self
        movies.append(movie)
        movies.sort { $0.name < $1.name}
    }
}


let adolfBook = Book(name: "Mein Kampf", author: "Adolf Hitler", year: 1925)
let harryBook = Book(name: "Harry Potter", author: "Joan Roaling", year: 1998)
let newBook = Book(name: "New Fashion", author: "Fashion Beatch", year: 2023)
let adolfBook2 = Book(name: "Rrrr, the grin of fascism", author: "Adolf Hitler", year: 1970)
let harryBook2 = Book(name: "Harry Potter 2", author: "Joan Roaling", year: 2000)
let harryBook3 = Book(name: "Harry Potter 3", author: "Joan Roaling", year: 2002)
let harryBook4 = Book(name: "Harry Potter 4", author: "Joan Roaling", year: 2004)
let harryBook5 = Book(name: "Harry Potter 5", author: "Joan Roaling", year: 2006)
let shortBook = Book(name: "Pupupu", author: "Japanec", year: 2)

adolfBook.addBook()
adolfBook2.addBook()
newBook.addBook()
harryBook.addBook()
harryBook2.addBook()
harryBook3.addBook()
harryBook4.addBook()
harryBook5.addBook()
shortBook.addBook()
for i in books {
    print(i.name)
}
// Сортировка по настроению
Book.sortByMood()
for i in books {
    print("\(i.mood!.rawValue) efe " + i.name)
}

// сделаем такое же для фильмов
let lotr = Movie(name: "Lord Of The Rings", artist: "Cameron J.", genre: .fantasy)
let lotr2 = Movie(name: "Lord Of The Rings 2", artist: "Cameron J.", genre: .fantasy)
let lotr3 = Movie(name: "Lord Of The Rings 3", artist: "Cameron J.", genre: .fantasy)
let scream = Movie(name: "Scream", artist: "Boogooman", genre: .horror)
let titanic = Movie(name: "Titanic", artist: "Goodman", genre: .drama)
let trueCrime = Movie(name: "Fisher", artist: "Kriminalnaya Rossiya", genre: .documentary)
let napoleon = Movie(name: "Napoleon", artist: "Fenix H.", genre: .historic)

lotr.addMovie()
lotr2.addMovie()
lotr3.addMovie()
scream.addMovie()
titanic.addMovie()
trueCrime.addMovie()
napoleon.addMovie()
