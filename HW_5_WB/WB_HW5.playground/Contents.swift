import Foundation
class Passport {
    let series: String
    let number: String
    let issueDate: Date
    weak var owner: Person?

    init(series: String, number: String, issueDate: Date, owner: Person?) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.owner = owner
        print("Passport \(series) \(number) initialized.")
    }

    deinit {
        print("Passport \(series) \(number) deinitialized.")
    }
}

class Person {
    let fullName: String
    let age: Int
    let passport: Passport?

    init(fullName: String, age: Int, passport: Passport?) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        passport?.owner = self
        print("Person \(fullName) initialized.")
    }

    deinit {
        print("Person \(fullName) deinitialized.")
    }
}
