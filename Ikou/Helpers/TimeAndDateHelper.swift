//
//  TimeAndDateHelper.swift
//  Ikou
//
//  Created by Salgara on 11/23/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import Foundation

class TimeAndDateHelper{
    
    static var shared = TimeAndDateHelper()
    
    func getTimeFrom(unix: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(unix))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
    
    func dateOf(_ string: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: string) ?? Date()
    }
    func stringOf(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    func getDayOfWeek(_ date: Date) -> Int? {
        let weekDay = Calendar.current.component(.weekday, from: date)
        return weekDay-1
    }
    func getMonthAndDay(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        return formatter.string(from: date)
    }
}
