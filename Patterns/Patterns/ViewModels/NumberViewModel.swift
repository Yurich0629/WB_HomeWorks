//
//  NumberViewModel.swift
//  Patterns
//
//  Created by Илья Десятов on 02.08.2024.
//

import Foundation

// MARK: - Observable
final class NumberViewModel: ObservableObject {
    @Published var number: Int = 0
    
    private let generator: RandomNumberGenerator
    
    init(generator: RandomNumberGenerator) {
        self.generator = generator
    }
    
    func generateNumber() {
        number = generator.generateRandomNumber()
    }
}
