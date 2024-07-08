//
//  CountdownBundle.swift
//  Countdown
//
//  Created by Илья Десятов on 07.07.2024.
//

import WidgetKit
import SwiftUI

@main
struct CountdownBundle: WidgetBundle {
    var body: some Widget {
        Countdown()
        CountdownLiveActivity()
    }
}
