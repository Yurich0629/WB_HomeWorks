//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    @Binding var profile: Profile
    @State private var draftProfile: Profile
    @State var isEditing = false
    
    init(profile: Binding<Profile>) {
        self._profile = profile
        self._draftProfile = State(initialValue: profile.wrappedValue)
    }
    
    var body: some View {
        ScrollView {
            if isEditing {
                TextField("Username", text: $draftProfile.username)
                Toggle("Notifications", isOn: $draftProfile.prefersNotifications)
                Picker("", selection: $draftProfile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { photo in
                        Text(photo.rawValue).tag(photo)
                    }
                }
                .pickerStyle(.segmented)
                
                DatePicker("Goal Date", selection: $draftProfile.goalDate, displayedComponents: .date)
            } else {
                Text(draftProfile.username).bold()
                    .font(.title)
                Text("Notifications: \(draftProfile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(draftProfile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(draftProfile.goalDate, style: .date)
            }
            
            Divider()
            Text("Complted Badges")
                .font(.headline)
            ScrollView {
                HStack {
                    HikeBadge(name: "First Hike")
                    HikeBadge(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                    HikeBadge(name: "Tenth Hike")
                        .grayscale(0.5)
                        .hueRotation(Angle(degrees: 45))
                }
                .padding(.bottom)
            }
        }
        
        .toolbar{ ToolbarItem(placement: .navigationBarTrailing) {
            Button (action: {
                self.isEditing.toggle()
            }, label: {
                Text(isEditing ? "Save" : "Edit")
            })
        } }
    }
}

#Preview {
    ProfileSummary(profile: .constant(.default))
        .environment(ModelData())
}

