//
//  ContactRowView.swift
//  ContactListGCD
//
//  Created by Илья Десятов on 7.08.2024.
//

import SwiftUI

class AsyncImageLoader: ObservableObject {
    @Published var image: Image?

       func loadImage(from name: String) {
           DispatchQueue.global().async {
               let image = Image(name)
               DispatchQueue.main.async {
                   self.image = image
               }
           }
       }
}


struct ContactRowView: View {
    
    @StateObject private var imageLoader = AsyncImageLoader()
    let contact: Contact
    
    private var initials: String {
        guard !contact.name.isEmpty else {
            return ""
        }
        let parts = contact.name.split(separator: " ").map(String.init)

        if parts.count > 1 {
            if let firstInitial = parts.first?.first.map(String.init),
               let lastInitial = parts[1].first.map(String.init) {
                return firstInitial + lastInitial
            }
        } else if let singleName = parts.first, singleName.count > 1 {
            let index = singleName.index(singleName.startIndex, offsetBy: 2)
            return String(singleName[..<index]).uppercased()
        } else if let singleInitial = parts.first?.first.map(String.init) {
            return singleInitial
        }
        
        return ""
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            colors: [
                Color.lightBlue,
                Color.naturalBlue
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var body: some View {
        HStack(spacing: 12) {
            avatarContainerView
            
            VStack(alignment: .leading, spacing: 2) {
                Text(contact.name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.darkPurple)
                Text(contact.status)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 56)
    }
    
    @ViewBuilder
    private var avatarContainerView: some View {
        HStack {
            ZStack {
                if let profileImage = contact.image {
                    if let image = imageLoader.image {
                        image
                            .resizable()
                            .frame(width: 48, height: 48)
                            .padding(.trailing, 10)
                    } else {
                        Rectangle()
                            .foregroundColor(Color.gray)
                            .frame(width: 48, height: 48)
                            .padding(.trailing, 10)
                            .onAppear {
                                imageLoader.loadImage(from: profileImage)
                            }
                    }
                } else {
                    Text(initials)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Color.white)
                        .frame(width: 48, height: 48)
                        .background(Circle().fill(Color.gray))
                        .padding(.trailing, 10)
                }
            }
            .overlay(storiesContainerView)
            .overlay(alignment: .topTrailing) { onlineCircleContainerView }
        }
    }
    
    @ViewBuilder
    private var onlineCircleContainerView: some View {
        if contact.isOnline {
            Circle()
                .fill(.green)
                .frame(width: 12, height: 12)
                .overlay(
                    Circle()
                        .stroke(lineWidth: 2)
                        .fill(.white)
                )
                .offset(x: 2, y: -2)
        }
    }
    
    @ViewBuilder
    private var storiesContainerView: some View {
        if contact.hasStories {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 2)
                .fill(gradient)
                .frame(width: 54, height: 54)
        }
    }
}


#Preview {
    ContactRowView(contact: .init(fullName: "Dad", status: "Online", isOnline: true, hasStories: true))
}

