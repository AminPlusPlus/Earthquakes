//
//  Date+Ext.swift
//  Earthquakes
//
//  Created by Aminjoni Abdullozoda on 3/13/21.
//

import Foundation

extension Date {
    
    func convertToYearMonthDateFormat() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        return dateformat.string(from: self)
    }
    
    func getNextPreviusDays(day : Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: self)!
    }
}
