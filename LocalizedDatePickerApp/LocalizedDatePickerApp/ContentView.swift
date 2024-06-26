//
//  ContentView.swift
//  LocalizedDatePickerApp
//
//  Created by Илья Десятов on 25.06.2024.
//

import SwiftUI

struct LocalizedDatePickerView: View {
    @State private var selectedDate: Date = Date()
    @State private var selectedLocaleIndex: Int = 0
    
    private let locales: [Locale] = [Locale(identifier: "en_US"), Locale(identifier: "ru_RU"), Locale(identifier: "fr_FR"), Locale(identifier: "es_ES"), Locale(identifier: "de_DE")]
    private let flags = ["🇺🇸", "🇷🇺", "🇫🇷", "🇪🇸", "🇩🇪"]
    
    var body: some View {
        VStack {
            DatePicker("Выберите дату", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.wheel)
                .padding()
            
            Picker("Выберите флаг", selection: $selectedLocaleIndex) {
                ForEach(0..<flags.count, id: \.self) { index in
                    Text(flags[index]).tag(index)
                }
            }.pickerStyle(.segmented)
            .padding()
            
            ForEach(Array(-2...2), id: \.self) { offset in
                let date = Calendar.current.date(byAdding: .day, value: offset, to: selectedDate)!
                let isToday = Calendar.current.isDateInToday(date)
                Text("\(date: date, style: .full, locale: locales[selectedLocaleIndex])")
                    .foregroundColor(isToday ? .red : .black)
            }
        }
    }
}

#Preview {
    LocalizedDatePickerView()
}
