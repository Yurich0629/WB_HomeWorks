//
//  AddAppIntent.swift
//  WidgetExtensionExtension
//
//  Created by Илья Десятов on 14.06.2024.
//

import Foundation
import AppIntents

struct AddAppIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Log an entry to your streak."
    
    static var description = IntentDescription("Adds 1 to your streak.")
    
    func perform() async throws -> some IntentResult & ReturnsValue {
        let data = DataService()
        data.log()
        
        return .result(value: data.progress())
    }
}
