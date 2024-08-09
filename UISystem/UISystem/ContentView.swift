//
//  ContentView.swift
//  UISystem
//
//  Created by Илья Десятов on 25.07.2024.
//

import SwiftUI
import UISystemModule

struct ContentView: View {
    
    @State var config: WheelPicker.Config = .init(count: 30, multiplier: 1)
    @State var value: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .lastTextBaseline, spacing: 5, content: {
                    let lbs = CGFloat(config.steps) * CGFloat(value)
                    Text(verbatim: "\(value)")
                        .font(.largeTitle.bold())
                        .contentTransition(.numericText(value: lbs))
                        .animation(.snappy, value: value)
                    
                    ComponentOne()
                    
                    Button("Update") {
                        withAnimation {
                            value = 0
                        }
                    }
                })
                .padding(.bottom, 30)
                
                WheelPicker(config: config, value: $value)
                    .frame(height: 60)
                
                HStack(alignment: .lastTextBaseline, spacing: 5, content: {
                    let lbs = CGFloat(config.steps) * CGFloat(value)
                    Text(verbatim: "\(value)")
                        .font(.largeTitle.bold())
                        .contentTransition(.numericText(value: lbs))
                        .animation(.snappy, value: value)
                    
                    ComponentOne()
                    
                    Button("Update") {
                        withAnimation {
                            value = 10
                        }
                    }
                })
                .padding(.bottom, 30)
                
                WheelPicker(config: config, value: $value)
                    .frame(height: 60)
            }
            .navigationTitle("Wheel Picker")
        }
    }
}

#Preview {
    ContentView()
}

