//
//  ContentView.swift
//  Patterns
//
//  Created by Илья Десятов on 02.08.2024.
//

import SwiftUI

// MARK: - Dependency Injection
struct ContentView: View {
    @ObservedObject var viewModel: NumberViewModel
    
    var body: some View {
        VStack {
            Text("Random Number: \(viewModel.number)")
                .font(.largeTitle)
                .padding()
            
            Button("Generate") {
                viewModel.generateNumber()
            }
            .padding()
        }
    }
}



