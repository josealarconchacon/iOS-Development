//
//  CreateReminderViewController.swift
//  RemindersApp
//
//  Created by Jose Alarcon Chacon on 2/10/21.
//

import UIKit

class CreateReminderViewController: UIViewController {
    
    var reminderIndex: Int?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var setDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getReminde()
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .inline
        }
    }
    
    // if a reminder exists, populate it on the screen
    func getReminde() {
        if let reminderIndex = reminderIndex {
            let reminder = ReminderService.share.getReminder(index: reminderIndex)
            textField.text = reminder.title
            datePicker.date = reminder.date
            completedSwitch.isOn = reminder.isCompleted
        }
    }
    
 
    
    @IBAction func saveButton(_ sender: UIButton) {
        // create a reminder object
        let reminder = Reminder(title: textField.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        
        
        // update save Button so can tell the difference between new or updating an existing reminder
        // update reminder
        if let reminderIndex = reminderIndex {
            ReminderService.share.updateReminder(reminder: reminder, index: reminderIndex)
        } else { // create a reminder
            ReminderService.share.createReminder(reminder: reminder)
        }
        // dissmis controller
        navigationController!.popViewController(animated: true)
    }
}
