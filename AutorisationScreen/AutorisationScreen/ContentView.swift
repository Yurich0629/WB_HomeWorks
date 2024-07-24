//
//  ContentView.swift
//  AutorisationScreen
//
//  Created by Илья Десятов on 16.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HeaderView()
        RegistrationScreenView(contact: PhoneNumberModel(phoneNumber: ""))
    }
}

#Preview {
    ContentView()
}
    
