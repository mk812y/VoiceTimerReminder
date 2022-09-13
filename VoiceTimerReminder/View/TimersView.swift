//
//  TimersView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 06.09.2022.
//

import SwiftUI

struct TimersView: View {
    @Binding var timerItems: [TimerModel]
    @State private var newTimerData = TimerModel.Data()
    
    var body: some View {
//        List {
//            ForEach(timerItems) { timerItem in
//                NavigationLink(destination: TimerDetail()) {
//                    TimerRow(timerItem: timerItem)
////                    TimerDetailEdit(data: TimerModel.Data)
//                }
//            }
//        }
//        .navigationTitle("Timers")
//        .toolbar {
//            Button(action: {}) {
//                Image(systemName: "plus")
//            }
//        }
        TimerAddNew(data: $newTimerData)
    }
}

struct TimersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimersView(timerItems: .constant(TimerModel.testData))
        }
        
    }
}
