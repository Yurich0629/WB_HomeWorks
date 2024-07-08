//
//  WidgetExtension.swift
//  WidgetExtension
//
//  Created by Илья Десятов on 14.06.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let data = DataService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), streak: data.progress())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), streak: data.progress())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, streak: data.progress())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let streak: Int
}

struct WidgetExtensionEntryView : View {
    var entry: Provider.Entry
    
    let data = DataService()
    
    private var pct: Double {
        Double(data.progress()) / 50.0
    }
    
    private var strokeStyle: StrokeStyle {
        StrokeStyle(
            lineWidth: 20,
            lineCap: .round,
            lineJoin: .round
        )
    }
    
    var body: some View {
        ZStack {
            progressView
            streakCounterView
        }
        .padding()
        .containerBackground(.black, for: .widget)
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
    
    private var streakCounterView: some View {
        Text(String(data.progress()))
            .font(.title)
            .bold()
            .foregroundStyle(Color.black)
            .fontDesign(.rounded)
    }
}

struct WidgetExtension: Widget {
    let kind: String = "WidgetExtension"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetExtensionEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetExtensionEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    WidgetExtension()
} timeline: {
    SimpleEntry(date: .now, streak: 1)
    SimpleEntry(date: .now, streak: 4)
}
