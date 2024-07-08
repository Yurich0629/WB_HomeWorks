//
//  ContentView.swift
//  WidgetAppExtension_WB_HW_3
//
//  Created by Илья Десятов on 14.06.2024.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage("streak", store: UserDefaults(suiteName: "group.desiatow.WidgetAppExtension-WB-HW-3")) var streak = 0
    
    private var pct: Double {
        Double(streak) / 50.0
    }
    
    private var strokeStyle: StrokeStyle {
        StrokeStyle(
            lineWidth: 20,
            lineCap: .round,
            lineJoin: .round
        )
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                progressView
                streakCounterView
            }
            .padding(.horizontal, 50)
            
            Spacer()
            
            Button {
                streak += 1
                
                WidgetCenter.shared.reloadTimelines(ofKind: "widgetextension")
            } label: {
                Text("+1")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal)
        }
        .background(.black, ignoresSafeAreaEdges: .all)
    }
    
    private var streakCounterView: some View {
        VStack {
            Text("Streak")
                .font(.largeTitle)
            Text(String(streak))
                .font(.system(size: 70))
                .bold()
        }
        .foregroundStyle(Color.white)
        .fontDesign(.rounded)
    }
    
    private var progressView: some View {
        ZStack {
            Circle()
                .stroke(.white.opacity(0.1), lineWidth: 20)
            Circle()
                .trim(from: 0, to: pct)
                .stroke(.blue, style: strokeStyle)
                .rotationEffect(.degrees(-90))
        }
    }
}


#Preview {
    ContentView()
}
