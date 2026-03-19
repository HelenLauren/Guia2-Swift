struct PointStruct {
    var x: Int
    var y: Int
}


class PointClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

//testing struct copy behavior
var struct1 = PointStruct(x: 10, y: 20)
var struct2 = struct1 

struct2.x = 50

print("Struct1 x: \(struct1.x)") // 10
print("Struct2 x: \(struct2.x)") // 50

//testing class copy behavior
var class1 = PointClass(x: 10, y: 20)
var class2 = class1

class2.x = 50

print("Class1 x: \(class1.x)") // 50
print("Class2 x: \(class2.x)") // 50