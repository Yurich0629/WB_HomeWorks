////
////  AppIntent.swift
////  Countdown
////
////  Created by Илья Десятов on 07.07.2024.
////
//

import AppIntents

@available(iOS 16.0, *)
struct ResetCountdownIntent: AppIntent {
    static var title: LocalizedStringResource = "Reset Countdown"

    static var description = IntentDescription("Resets the countdown timer to the default duration.")

    func perform() async throws -> some IntentResult {
        NotificationCenter.default.post(name: .resetCountdown, object: nil)
        return .result()
    }
}

extension Notification.Name {
    static let resetCountdown = Notification.Name("resetCountdown")
}
//import WidgetKit
//import AppIntents
//
//struct ConfigurationAppIntent: WidgetConfigurationIntent {
//    static var title: LocalizedStringResource = "Configuration"
//    static var description = IntentDescription("This is an example widget.")
//
//    // An example configurable parameter.
//    @Parameter(title: "Favorite Emoji", default: "😃")
//    var favoriteEmoji: String
//}
