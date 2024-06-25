//
//  TabBarItem.swift
//  ContactListWB_HW2
//
//  Created by Илья Десятов on 12.06.2024.
//

import Foundation

enum TabItem: CaseIterable {
    case contacts
    case chat
    case etc
    
    var imageName: String {
        switch self {
        case .contacts: "person.2"
        case .chat: "message"
        case .etc: "ellipsis"
        }
    }
}
