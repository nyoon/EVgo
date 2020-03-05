//
//  DateHelpers.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/5/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import Foundation

extension Date {
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        
        return Date(timeInterval: seconds, since: self)
    }
    
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate(dateFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}
