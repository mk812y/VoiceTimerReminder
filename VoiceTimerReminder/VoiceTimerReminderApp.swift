//
//  VoiceTimerReminderApp.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 06.09.2022.
//

import SwiftUI

@main
struct VoiceTimerReminderApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TimersView(timerItems: .constant(TimerModel.testData))
            }
        }
    }
}
