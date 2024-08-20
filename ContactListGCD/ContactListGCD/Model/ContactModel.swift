//
//  ContactModel.swift
//  ContactListGCD
//
//  Created by Илья Десятов on 07.08.2024.
//

import SwiftUI

struct Contact: Identifiable {
    let id: UUID
    let image: String?
    let name: String
    let status: String
    let isOnline: Bool
    let hasStories: Bool
    
    init(
        icon: String? = nil,
        fullName: String,
        status: String,
        isOnline: Bool,
        hasStories: Bool
    ) {
        self.id = UUID()
        self.image = icon
        self.name = fullName
        self.status = status
        self.isOnline = isOnline
        self.hasStories = hasStories
    }
}

// MARK: - Convert

extension Contact {
    func toProfile() -> Profile {
        Profile(
            image: image,
            name: name,
            phone: "+7 999 999-99-99"
        )
    }
}

// MARK: - Mock Data

extension Contact {
    static let mockData: [Contact] = [
        .init(
            icon: "contact-1",
            fullName: "Анастасия Иванова",
            status: "Last seen yesterday",
            isOnline: false,
            hasStories: false
        ),
        
        .init(
            icon: "contact-2",
            fullName: "Петя",
            status: "Online",
            isOnline: true,
            hasStories: false
        ),
        
        .init(
            icon: "contact-3",
            fullName: "Маман",
            status: "Last seen 3 hours ago",
            isOnline: false,
            hasStories: true
        ),
        
        .init(
            icon: "contact-4",
            fullName: "Арбуз Дыня",
            status: "Online",
            isOnline: true,
            hasStories: false
        ),
        
        .init(
            fullName: "Иван Иванов",
            status: "Online",
            isOnline: true,
            hasStories: false
        ),
        
        .init(
            fullName: "Лиса Алиса",
            status: "Last seen 30 minutes ago",
            isOnline: false,
            hasStories: true
        ),
    ]
}


