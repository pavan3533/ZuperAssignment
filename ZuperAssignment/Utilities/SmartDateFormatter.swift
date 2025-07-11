//
//  SmartDateFormatter.swift
//  ZuperAssignment
//
//  Created by Pavan Javali on 11/07/25.
//

import Foundation

import Foundation

enum SmartDateFormatter {
    static func string(from date: Date, now: Date = .now) -> String {
        let calendar = Calendar.current
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"      
        
        if calendar.isDateInToday(date) {
            return "Today, \(timeFormatter.string(from: date))"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow, \(timeFormatter.string(from: date))"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday, \(timeFormatter.string(from: date))"
        } else {
            let fullFormatter = DateFormatter()
            fullFormatter.dateFormat = "dd/MM/yyyy, h:mm a"
            return fullFormatter.string(from: date)
        }
    }
}

