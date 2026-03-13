class Person {

    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        print("Person \(name) was created.")
    }

    func showInfo() {
        print("Name: \(name) | Age: \(age)")
    }

    deinit {
        print("Person \(name) is being removed from memory.")
    }
}

//testing
var person1: Person? = Person(name: "Heloise", age: 25)

person1?.showInfo()

person1 = nil