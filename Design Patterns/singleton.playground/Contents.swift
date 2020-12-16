import Foundation

class ExecutiveOfficer{
    var salary = 1_000_000
    
    // Create a Singleton via type property
    static var shared = ExecutiveOfficer()
}

// Access the Singleton by referencing the name of the typ
ExecutiveOfficer.shared.salary
