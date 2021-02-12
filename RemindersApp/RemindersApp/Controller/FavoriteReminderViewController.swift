//
//  FavoriteReminderViewController.swift
//  RemindersApp
//
//  Created by Jose Alarcon Chacon on 2/10/21.
//

import UIKit

class FavoriteReminderViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorite()
    }
    
    func favorite() {
        if let favoriteReminder = ReminderService.share.favoriteReminder() {
            titleLabel.text = favoriteReminder.title
            // date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy hh:mma"
            dateLabel.text = dateFormatter.string(from: favoriteReminder.date)
        }
    }
}
