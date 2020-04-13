//
//  Date.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-13.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import Foundation

extension Date {
    private struct Holder {
        static let weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    }
    
    func GetCurrentDate() -> String {
        let calendar = Calendar.current
        let date = Date()
        
        return String(calendar.component(.day, from: date)) + "/" + String(calendar.component(.month, from: date)) + "/" + String(calendar.component(.year, from: date))
        
    }
    
    func GetCurrentWeekday() -> String {
        return Holder.weekdays[DayNumberOfWeek()-1]
    }
    
    func DayNumberOfWeek() -> Int! {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

