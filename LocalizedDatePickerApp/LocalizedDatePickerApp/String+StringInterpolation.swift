//
//  String+StringInterpolation.swift
//  LocalizedDatePickerApp
//
//  Created by Илья Десятов on 25.06.2024.
//

import SwiftUI

extension String.StringInterpolation {
    mutating func appendInterpolation(date: Date, style: DateFormatter.Style, locale: Locale) {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.locale = locale
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE, MMMM d, yyyy", options: 0, locale: locale)
        appendInterpolation(formatter.string(from: date))
    }
}

