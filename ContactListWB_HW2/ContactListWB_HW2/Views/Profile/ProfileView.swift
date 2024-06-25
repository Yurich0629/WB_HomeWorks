//
//  ProfileView.swift
//  WelcomeAppWB
//
//  Created by Илья Десятов on 18.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss)
    var dismiss
    
    let profile: Profile
    
    var body: some View {
        VStack {
            headerView
            Spacer()
            InfoProfileView(profile: profile)
            Spacer()
        }
        .navigationBarHidden(true)
    }
    
    private var headerView: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "chevron.left")
                    Text("Профиль")
                }
            }
            .foregroundStyle(Color.darkPurple)
            
            Spacer()
            
            Image(systemName: "pencil")
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ProfileView(profile: Profile(name: "arrow", phone: "+7..."))
}




