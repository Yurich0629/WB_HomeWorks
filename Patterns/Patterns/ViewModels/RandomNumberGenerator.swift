//
//  RandomNumberGenerator.swift
//  Patterns
//
//  Created by Илья Десятов on 02.08.2024.
//

import Foundation

// MARK: - Singleton
final class RandomNumberGenerator {
    static let shared = RandomNumberGenerator()
    
    private init() {}
    
    func generateRandomNumber() -> Int {
        return Int.random(in: 0..<100)
    }
}
