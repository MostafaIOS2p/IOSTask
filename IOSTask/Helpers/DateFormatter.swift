//
//  DateFormatter.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 15/06/2022.
//

import Foundation


func changeDateFromatter(fromFromate: String,toFormate: String, selectedDate: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = NSLocale.current
    dateFormatter.setLocalizedDateFormatFromTemplate(fromFromate)
    let newDate = dateFormatter.date(from: selectedDate)
    dateFormatter.setLocalizedDateFormatFromTemplate(toFormate)
    dateFormatter.locale = NSLocale.current
    return dateFormatter.string(from: newDate ?? Date())
}
