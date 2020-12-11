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
    }
    
    @IBAction func stepperDidChanged(_ sender: UIStepper) {
    }
    @IBAction func createStoryDidTap(_ sender: UIButton) {
    }
}

