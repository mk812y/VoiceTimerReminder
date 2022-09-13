//
//  TimerAddNew.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 13.09.2022.
//

import SwiftUI

struct TimerAddNew: View {
    @State private var name = "Timer"
    @State private var hours = [Int](0...23)
    @State private var selectedHours = 1
    @State private var minutes = [Int](0...59)
    @State private var selectedMinutes = 30
    
    var body: some View {
            Form {
                Section(header: Text("Timer name")) {
                    TextField("sdf", text: $name)
                }
                Section(header: Text("Timer time")) {
                    HStack {
                        HStack {
                            Picker("sd", selection: $selectedHours) {
                                ForEach(hours, id: \.self) { hour in
                                    Text("\(hour)")
                                        .font(.title)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 40)
                            .clipped()
                            Text("hours")
                                .font(.title2)
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 50))
                        HStack {
                            Picker("", selection: $selectedMinutes) {
                                ForEach(minutes, id: \.self) { minute in
                                    Text("\(minute)")
                                        .font(.title)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(width: 40)
                            .clipped()
                            Text("min")
                                .font(.title2)
                        }
                        .padding(.horizontal)
                    }
                }
                Section(header: Text("Theme color")) {
                    TextField("sdf", text: $name)
                }
            }
            .navigationTitle("Add Timer")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct TimerAddNew_Previews: PreviewProvider {
    static var previews: some View {
        TimerAddNew()
    }
}
