//
//  HeaderView.swift
//  VerificationScreen
//
//  Created by Илья Десятов on 16.07.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        icon
    }
    private var icon: some View {
        HStack {
            Button {
                
            } label: {
                HStack() {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
            }
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    HeaderView()
}
