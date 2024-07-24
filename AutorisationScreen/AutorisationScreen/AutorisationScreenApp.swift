//
//  AutorisationScreenApp.swift
//  AutorisationScreen
//
//  Created by Илья Десятов on 16.07.2024.
//

import SwiftUI

@main
struct AutorisationScreenApp: App {
    var body: some Scene {
        WindowGroup {
            RegistrationScreenView(contact: PhoneNumberModel(phoneNumber: ""))
        }
    }
}
