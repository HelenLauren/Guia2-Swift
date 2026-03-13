//Create a class named Car with properties brand, model, and year. 
// Add a willSet observer to print when year is changed.

class Car {

    var brand: String
    var model: String

    var year: Int {
        willSet {
            print("O ano será alterado de \(year) para \(newValue)")
        }
    }

    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
}

//testing
let carro = Car(brand: "Subaru", model: "WRX", year: 2017)

carro.year = 2016