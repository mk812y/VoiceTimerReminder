//
//  ContentView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 06.09.2022.
//

import SwiftUI

struct ContentView: View {
    let timerItems: [TimerModel]
    
    var body: some View {
        List {
            ForEach(timerItems) { timerItem in
                TimerView(timerItem: timerItem)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(timerItems: TimerModel.testData)
    }
}
