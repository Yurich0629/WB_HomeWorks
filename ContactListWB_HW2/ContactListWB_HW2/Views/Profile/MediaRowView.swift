//
//  MediaRowView.swift
//  ContactListWB_HW2
//
//  Created by Илья Десятов on 18.06.2024.
//

import SwiftUI

struct MediaRowView: View {
    let name: String

    var body: some View {
        Button {} label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 2)
                    .frame(width: 72, height: 40)
                    .foregroundStyle(Color.lightPurple)
                
                Image(name)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}

#Preview {
    MediaRowView(name: "instagram")
}
