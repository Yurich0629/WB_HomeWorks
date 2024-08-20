//
//  Profile.swift
//  ContactListGCD
//
//  Created by Илья Десятов on 07.08.2024.
//

import Foundation

struct Profile {
    let image: String?
    let name: String
    let phone: String
    let medias: [String]

    private let mediasDefault: [String] = [
        "twitter",
        "instagram",
        "linkedin",
        "facebook"
    ]

    init(
        image: String? = nil,
        name: String,
        phone: String,
        medias: [String] = []
    ) {
        self.image = image
        self.name = name
        self.phone = phone
        self.medias = medias.isEmpty ? mediasDefault : medias
    }
}
