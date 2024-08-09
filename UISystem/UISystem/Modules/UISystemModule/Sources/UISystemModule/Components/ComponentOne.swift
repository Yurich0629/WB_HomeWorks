//
//  ComponentOne.swift
//
//
//  Created by Илья Десятов on 25.07.2024.
//

import SwiftUI

public struct ComponentOne: View {
    public init() {}
    public var body: some View {
        Text("lbs")
            .font(.title2)
            .fontWeight(.semibold)
//             .textScale(.secondary)
            .foregroundStyle(.gray)
    }
}

#Preview {
    ComponentOne()
}
