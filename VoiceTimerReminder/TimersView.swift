//
//  TimersView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 06.09.2022.
//

import SwiftUI

struct TimersView: View {
    @Binding var timerItems: [TimerModel]
//    @State private var newTimerData = TimerModel.Data()
    
    var body: some View {
        List {
            ForEach(timerItems) { timerItem in
                NavigationLink(destination: TimerDetailView()) {
                    TimerRowView(timerItem: timerItem)
                }
            }
        }
        .navigationTitle("Timers")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
        }
    }
}

struct TimersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimersView(timerItems: .constant(TimerModel.testData))
        }
        
    }
}
