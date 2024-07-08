//
//  CountdownLiveActivity.swift
//  Countdown
//
//  Created by Илья Десятов on 07.07.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CountdownAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CountdownLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CountdownAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CountdownAttributes {
    fileprivate static var preview: CountdownAttributes {
        CountdownAttributes(name: "World")
    }
}

extension CountdownAttributes.ContentState {
    fileprivate static var smiley: CountdownAttributes.ContentState {
        CountdownAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CountdownAttributes.ContentState {
         CountdownAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CountdownAttributes.preview) {
   CountdownLiveActivity()
} contentStates: {
    CountdownAttributes.ContentState.smiley
    CountdownAttributes.ContentState.starEyes
}
