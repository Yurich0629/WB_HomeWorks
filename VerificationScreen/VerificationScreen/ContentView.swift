//
//  ContentView.swift
//  VerificationScreen
//
//  Created by Илья Десятов on 16.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            OtpFormFieldView()
        }
        .frame(maxHeight: .infinity)
        .overlay(alignment: .topLeading) {
            HeaderView()
        }
    }
}

#Preview {
    ContentView()
}
