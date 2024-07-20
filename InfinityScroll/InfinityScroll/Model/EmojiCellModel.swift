//
//  EmojiModel.swift
//  InfinityScroll
//
//  Created by Илья Десятов on 09.07.2024.
//

import SwiftUI

struct EmojiCellModel: View {
    var body: some View {
        ZStack {
            VStack {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(height: 50)
                }
            }
            Text(randomEmoji())
                .font(.largeTitle)
                .opacity(0.5)
        }
        .padding()
    }
    
    func randomEmoji() -> String {
        let emojis = (0x1F300...0x1F3F0).map { UnicodeScalar($0)! }
        return String(emojis.randomElement()!)
    }
}
