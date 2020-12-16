import Foundation

// Protocol that the Delegate confirm to
protocol JobDescription{
    func buildiOSApp()
}


// Delegate
class Engineer: JobDescription{
    // property
    var name: String
    
    // initializer
    init(name: String) {
        self.name = name
    }
    
    // confirm to protocol
    func buildiOSApp() {
        print("\(name) is building an iOS App that will be rilize in two months")
    }
}

class Agency: JobDescription{
    func buildiOSApp() {
        print("Agency is building an iOS App")
    }
}


// Delegator
class ChiefTechnologyOffecer{
    var delegate: JobDescription?
    
    // methods
    func buildProduct() {
        print("We have to recruit engineers")
        delegate?.buildiOSApp()
    }
}

// create object
let tom = ChiefTechnologyOffecer()
// initilaze Bob as an engineer
let bob = Engineer(name: "Bob")
// set the connection between the delegator and the delegate
tom.delegate = bob
tom.buildProduct()

let agancy = Agency()
tom.delegate = agancy
tom.buildProduct()
