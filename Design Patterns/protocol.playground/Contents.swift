import Foundation

protocol Moveable{
    func moveFoward(miles_per_hour: Int)
    func moveBackward(miles_per_hour: Int)
    func turnLeft()
    func turnRight()
}


// Define Classes that conform to the Protocol
class Car: Moveable{
    func moveFoward(miles_per_hour: Int) {
        <#code#>
    }
    
    func moveBackward(miles_per_hour: Int) {
        <#code#>
    }
    
    func turnLeft() {
        <#code#>
    }
    
    func turnRight() {
        <#code#>
    }
    

}
