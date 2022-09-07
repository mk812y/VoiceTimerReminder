//
//  ContentView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 06.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            TimerView()
            TimerView()
            TimerView()
            TimerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
