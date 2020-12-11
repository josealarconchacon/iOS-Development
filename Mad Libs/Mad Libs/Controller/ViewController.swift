//
//  ViewController.swift
//  Mad Libs
//
//  Created by Jose Alarcon Chacon on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var madLibLogo: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberOfPetsLable: UILabel!
    @IBOutlet weak var animalSegmenteControl: UISegmentedControl!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var happySwitch: UISwitch!
    @IBOutlet weak var countinerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func lessOrMoreValueChange(_ sender: UISegmentedControl) {
        // if user tap on less -> hide the container view
        if sender.selectedSegmentIndex == 0{
            countinerView.isHidden = true
            // if user tap on more -> show the container view
        } else if sender.selectedSegmentIndex == 1{
            countinerView.isHidden = false
        }
    }
    
    @IBAction func sliderDidChanged(_ sender: UISlider) {
        // update the label on the left of the slider base on the current value
        numberLabel.text = "\(Int((sender.value)))"
    }
    
    @IBAction func stepperDidChanged(_ sender: UIStepper) {
        // update lable on the left of the stepper base on current value
        numberOfPetsLable.text = "\(Int(sender.value))"
    }
    @IBAction func createStoryDidTap(_ sender: UIButton) {
        let animal = animalSegmenteControl.titleForSegment(at: animalSegmenteControl.selectedSegmentIndex)
        let happyEnding = happySwitch.isOn ? "Now they live happily ever after" : "Things did not turn out too well..."
        let story = "At the age of \(ageTextField.text!), \(firstNameTextField.text!) took a trip to \(locationTextField.text!) with \(Int(numberOfPetsStepper.value)) pets in order to \(verbTextField.text!) with a \(animal!). \(firstNameTextField.text!) decided to buy \(Int(numberSlider.value)). \(happyEnding)"
        print(story)
        
    }
}

