//
//  TimerDetailEdit.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 08.09.2022.
//

import SwiftUI

struct TimerDetailEdit: View {
    @Binding var data: TimerModel.Data
//    @State var hours: Int = 0
//    @State var minutes: Int = 0
    
    private var convertValue: Int {
        return Int(data.timeLenghtInSeconds) / 60
    }
    
    var body: some View {
        Form {
            Section(header: Text("Timer")) {
                TextField("Name", text: $data.title)
                HStack {
                    Slider(value: $data.timeLenghtInSeconds, in: 5...60, step: 1) {
                        Text("leght")
                    }
                    Text("\(Int(data.timeLenghtInSeconds) / 60) minutes")
                    Picker("", selection: $hours) {
                        ForEach(0..<24, id: \.self) { h in
                            Text("\(h)").tag(h)
                        }
                    }
                    Picker("", selection: $minutes) {
                        ForEach(0..<61, id: \.self) { m in
                            Text("\(m)").tag(m)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct TimerDetailEdit_Previews: PreviewProvider {
    static var previews: some View {
        TimerDetailEdit(data: .constant(TimerModel.testData[0].data))
    }
}
