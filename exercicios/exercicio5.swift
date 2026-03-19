protocol GeometricShape {
    func calculateArea() -> Double
}


struct Rectangle: GeometricShape {
    var width: Double
    var height: Double
    
    func calculateArea() -> Double {
        return width * height
    }
}

//example
let rectangle = Rectangle(width: 5.0, height: 3.0)
print("Rectangle area: \(rectangle.calculateArea())")