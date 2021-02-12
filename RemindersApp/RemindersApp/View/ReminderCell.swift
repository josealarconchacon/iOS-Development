//
//  ReminderCell.swift
//  RemindersApp
//
//  Created by Jose Alarcon Chacon on 2/10/21.
//

import UIKit

class ReminderCell: UITableViewCell {
    
    @IBOutlet weak var isCompleted: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var info: UIButton!
    
    func update(reminder: Reminder, index: Int) {
        titleLabel.text = reminder.title
        
        info.tag = index
        
        // isCompletedView
        completedView()
        // date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateLabel.text = dateFormatter.string(from: reminder.date)
        
        // completed view
        if reminder.isCompleted {
            isCompleted.backgroundColor = .green
            isCompleted.layer.borderWidth = 0.0
        } else {
            isCompleted.backgroundColor = .white
            isCompleted.layer.borderWidth = 2.0
        }
    }
    
    func completedView() {
        isCompleted.layer.cornerRadius = isCompleted.frame.size.width / 2.0
        isCompleted.layer.borderColor = UIColor.lightGray.cgColor
    }
}
