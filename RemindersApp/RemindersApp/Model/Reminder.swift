//
//  Reminder.swift
//  RemindersApp
//
//  Created by Jose Alarcon Chacon on 2/10/21.
//

import Foundation

class Reminder: Codable {
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(title: String, date: Date, isCompleted: Bool) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
