import Foundation

class ElectronicDevice {
    
  // immutable
    let brand: String
    
    //mutable
    var model: String
    var isOn: Bool = false
    
    //encapsulated
    private(set) var serialNumber: String
    

    var price: Double {
        willSet {
            print("Price will change from \(price) to \(newValue)")
        }
        didSet {
            print("Price changed from \(oldValue) to \(price)")
        }
    }
    
    var priceWithDiscount: Double {
        return price * 0.9
    }
    

    init(brand: String, model: String, price: Double) {
        self.brand = brand
        self.model = model
        self.price = price
        self.serialNumber = UUID().uuidString.prefix(8).uppercased()
    }
    
    convenience init(brand: String, model: String) {
        self.init(brand: brand, model: model, price: 99.99)
    }
    

    func turnOn() {
        if !isOn {
            isOn = true
            print("Device turned on")
        }
    }
    
    func turnOff() {
        if isOn {
            isOn = false
            print("Device turned off")
        }
    }
    
    func showDetails() {
        print("""
        Brand: \(brand)
        Model: \(model)
        Serial: \(serialNumber)
        Price: \(price)
        Status: \(isOn ? "On" : "Off")
        """)
    }
    
    func applyDiscount(percent: Double) {
        price -= price * (percent / 100)
    }
    
    deinit {
        print("Device \(model) removed from memory")
    }
}

//using final
final class Smartphone: ElectronicDevice {
    
    var screenSize: Double
    var hasCamera: Bool
    
    init(brand: String, model: String, price: Double, screenSize: Double, hasCamera: Bool) {
        self.screenSize = screenSize
        self.hasCamera = hasCamera
        super.init(brand: brand, model: model, price: price)
    }
    
    override func showDetails() {
        super.showDetails()
        print("Screen: \(screenSize) | Camera: \(hasCamera)")
    }
    
    func takePhoto() {
        if isOn && hasCamera {
            print("Photo taken 📸")
        } else {
            print("Cannot take photo")
        }
    }
    
    deinit {
        print("Smartphone deallocated")
    }
}


class Notebook: ElectronicDevice {
    
    var screenSize: Double
    var storage: Int
    
    init(brand: String, model: String, price: Double, screenSize: Double, storage: Int) {
        self.screenSize = screenSize
        self.storage = storage
        super.init(brand: brand, model: model, price: price)
    }
    
    override func showDetails() {
        super.showDetails()
        print("Screen: \(screenSize) | Storage: \(storage)GB")
    }
    
    deinit {
        print("Notebook deallocated")
    }
}

//using protocol
protocol Updatable {
    func updateSoftware()
}

//using extension
extension Notebook: Updatable {
    func updateSoftware() {
        print("Notebook software updated")
    }
}

extension String {
    func formatToSerial(length: Int) -> String {
        return self.count >= length
        ? String(self.prefix(length))
        : String(repeating: "0", count: length - self.count) + self
    }
}

//scturct choice, simple data, no identity, independent copies
struct Accessory {
    var name: String
    var price: Double
}

//using the polimorfism
let devices: [ElectronicDevice] = [
    Smartphone(brand: "Apple", model: "iPhone", price: 5000, screenSize: 6.1, hasCamera: true),
    Notebook(brand: "Dell", model: "XPS", price: 7000, screenSize: 15.6, storage: 512)
]

for device in devices {
    device.showDetails()
    print("-----")
}

//Example testing
let phone = Smartphone(brand: "Samsung", model: "Galaxy", price: 3000, screenSize: 6.5, hasCamera: true)

phone.turnOn()
phone.takePhoto()
phone.applyDiscount(percent: 10)
print("Discounted price: \(phone.priceWithDiscount)")