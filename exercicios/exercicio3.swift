class Animal {

    func makeSound() {
        print("The animal makes a sound.")
    }

}

//menção honrosa para a Salaminha minha gatinha
class Cat: Animal {

    override func makeSound() {
        print("miau miau miauuu")
    }
}
class Dog: Animal {

    override func makeSound() {
        print("AU AU AU AU AUAUAU")
    }

}

//testing
let animal = Animal()
animal.makeSound()

let dog = Dog()
dog.makeSound()