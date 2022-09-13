//
//  TimerAddNew.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 13.09.2022.
//

import SwiftUI

struct TimerAddNew: View {
    @State private var name = "Timer 1"
    @State private var hours = [Int](0...23)
    @State private var selectedHours = 1
    @State private var minutes = [Int](0...59)
    @State private var selectedMinutes = 30
    
    var body: some View {
        NavigationView {
            HStack {
                Picker("", selection: $selectedHours) {
                    ForEach(hours, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 100, height: 100)
                .clipped()
                Spacer()
                Picker("", selection: $selectedMinutes) {
                    ForEach(minutes, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 100, height: 100)
                .clipped()
            }
        }
    }
}

struct TimerAddNew_Previews: PreviewProvider {
    static var previews: some View {
        TimerAddNew()
    }
}
