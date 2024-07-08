//
//  DataService.swift
//  WidgetExtensionExtension
//
//  Created by Илья Десятов on 14.06.2024.
//

import Foundation
import SwiftUI

struct DataService {
    @AppStorage("streak", 
                store: UserDefaults(
                    suiteName: "group.desiatow.WidgetAppExtension-WB-HW-3"))
    private var streak = 0
    
    func log() {
        streak += 1
    }
    
    func progress() -> Int {
        return streak
    }
}
