//
//  InfoProfileView.swift
//  ContactListWB_HW2
//
//  Created by Илья Десятов on 12.06.2024.
//

import SwiftUI

struct InfoProfileView: View {
    let profile: Profile

    var body: some View {
        VStack(spacing: 40) {
            VStack(spacing: 20) {
                Image(profile.image ?? "ChangeAvatar")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                VStack(spacing: .zero) {
                    Text(profile.name)
                        .foregroundStyle(.darkPurple)
                    Text(profile.phone)
                        .font(.footnote)
                        .foregroundStyle(.whiteForDigits)
                }
            }
            HStack(spacing: 12) {
                ForEach(profile.medias, id: \.self) { media in
                    MediaRowView(name: media)
                }
            }
        }
    }
}

#Preview {
    InfoProfileView(profile: Profile(name: "name", phone: "+79999999999"))
}
