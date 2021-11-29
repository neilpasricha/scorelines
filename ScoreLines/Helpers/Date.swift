//
//  Date.swift
//  Localist
//
//  Created by Steven Tran on 11/10/20.
//  Copyright © 2020 Localist. All rights reserved.
//

import Foundation


func timeSince(_ interval: TimeInterval) -> String {
    let formatter = RelativeDateTimeFormatter()
    return formatter.localizedString(for: Date(timeIntervalSince1970: interval), relativeTo: Date())
}

func convert_date(_ date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSZ"
    let date_obj = dateFormatter.date(from:date)!
    dateFormatter.dateFormat = "MM-dd-yyyy"
    let formattedDate = dateFormatter.string(from:date_obj)
    
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd-yyyy"
    let result = formatter.string(from: date)

    if formattedDate == result
    {
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from:date_obj)
    }
    else
    {
        return formattedDate
    }
}
