//
//  VoiceTimerReminderApp.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 06.09.2022.
//

import SwiftUI

@main
struct VoiceTimerReminderApp: App {
    @StateObject private var store = TimerStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TimersView(timerItems: $store.timers) {
                    Task {
                        do {
                            try await TimerStore.save(timers: store.timers)
                        } catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
            }
            .task {
                do {
                    store.timers = try await TimerStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                store.timers = TimerModel.testData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
