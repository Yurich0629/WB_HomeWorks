//
//  ViewFactory.swift
//  Patterns
//
//  Created by Илья Десятов on 02.08.2024.
//

import Foundation
import SwiftUI

// MARK: - Factory
struct ViewFactory {
    static func createContentView() -> some View {
 let generator = RandomNumberGenerator.shared
        let viewModel = NumberViewModel(generator: generator)
        return ContentView(viewModel: viewModel)
    }
}
