import UIKit

class Student{
    // Instance property
    let firstName: String
    
    // type property
    static var numberOfStudents = 0
    
    // type methods
    static func getRecord() {
        print("There are \(Student.numberOfStudents) students")
    }
    
    // initializer the Student class
    init(firstName: String) {
        self.firstName = firstName
        Student.numberOfStudents = Student.numberOfStudents + 1
    }
}

let bob = Student(firstName: "Bob")
let tommy = Student(firstName: "Tommy")
let tom = Student(firstName: "Tom")

bob.firstName

// Accessing the type property by referencing the type itself
Student.numberOfStudents

// incoke type methods
Student.getRecord()
