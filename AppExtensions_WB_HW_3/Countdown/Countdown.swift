////
////  Countdown.swift
////  Countdown
////
////  Created by Илья Десятов on 07.07.2024.
////
//
import WidgetKit
import SwiftUI

struct Countdown: TimelineEntry {
    let date: Date
    var remainingTime: TimeInterval
}

class CountdownProvider: TimelineProvider {
    private var remainingTime: TimeInterval = 3600

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(resetCountdown), name: .resetCountdown, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func resetCountdown() {
        remainingTime = 3600
        WidgetCenter.shared.reloadAllTimelines()
    }

    func placeholder(in context: Context) -> Countdown {
        Countdown(date: Date(), remainingTime: remainingTime)
    }

    func getSnapshot(in context: Context, completion: @escaping (Countdown) -> Void) {
        let entry = Countdown(date: Date(), remainingTime: remainingTime)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Countdown>) -> Void) {
        var entries: [Countdown] = []
        let currentDate = Date()

        // Update every second
        for secondOffset in 0..<Int(remainingTime) {
            let entryDate = Calendar.current.date(byAdding: .second, value: secondOffset, to: currentDate)!
            let remainingTime = self.remainingTime - TimeInterval(secondOffset)
            let entry = Countdown(date: entryDate, remainingTime: remainingTime)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct CountdownWidgetEntryView : View {
    var entry: CountdownProvider.Entry

    var body: some View {
        VStack {
            Text("Time Remaining")
                .font(.headline)
            Text(entry.remainingTimeString)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.red)
        }
        .padding()
    }
}

extension Countdown {
    var remainingTimeString: String {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

@main
struct CountdownWidget: Widget {
    let kind: String = "CountdownWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CountdownProvider()) { entry in
            CountdownWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Countdown Timer")
        .description("Displays a countdown timer.")
        .supportedFamilies([.systemSmall])
       // .appIntents([ResetCountdownIntent()]) // Add the intent to the widget configuration
    }
}

struct CountdownWidget_Previews: PreviewProvider {
    static var previews: some View {
        CountdownWidgetEntryView(entry: Countdown(date: Date(), remainingTime: 3600))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
//import WidgetKit
//import SwiftUI
//
//struct Provider: AppIntentTimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
//    }
//
//    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: configuration)
//    }
//    
//    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//
//        return Timeline(entries: entries, policy: .atEnd)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let configuration: ConfigurationAppIntent
//}
//
//struct CountdownEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        VStack {
//            Text("Time:")
//            Text(entry.date, style: .time)
//
//            Text("Favorite Emoji:")
//            Text(entry.configuration.favoriteEmoji)
//        }
//    }
//}
//
//struct Countdown: Widget {
//    let kind: String = "Countdown"
//
//    var body: some WidgetConfiguration {
//        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
//            CountdownEntryView(entry: entry)
//                .containerBackground(.fill.tertiary, for: .widget)
//        }
//    }
//}
//
//extension ConfigurationAppIntent {
//    fileprivate static var smiley: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "😀"
//        return intent
//    }
//    
//    fileprivate static var starEyes: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "🤩"
//        return intent
//    }
//}
//
//#Preview(as: .systemSmall) {
//    Countdown()
//} timeline: {
//    SimpleEntry(date: .now, configuration: .smiley)
//    SimpleEntry(date: .now, configuration: .starEyes)
//}
