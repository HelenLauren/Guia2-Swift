//superclass
class Employee {
    var baseSalary: Double = 2000.0
    
    //we will override this method
    func calculateSalary() -> Double {
        return baseSalary
    }
}

//subclass
class Manager: Employee {
    var bonus: Double = 6000.0
    
    //using FINAL
    final override func calculateSalary() -> Double {
        return baseSalary + bonus
    }
}

//example
let employee = Employee()
print("Employee salary: \(employee.calculateSalary())")

let manager = Manager()
print("Manager salary: \(manager.calculateSalary())")