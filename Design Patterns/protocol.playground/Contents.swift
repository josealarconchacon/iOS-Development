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
        print("moving forward \(miles_per_hour) in car")
    }
    
    func moveBackward(miles_per_hour: Int) {
        print("moving backward \(miles_per_hour) in car")
    }
    
    func turnLeft() {
        print("turning left in the next street")
    }
    
    func turnRight() {
        print("turning right in the main avenu")
    }
    

}
