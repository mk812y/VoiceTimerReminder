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
                
            }
        }
    }
}

struct TimerDetailEdit_Previews: PreviewProvider {
    static var previews: some View {
        TimerDetailEdit(data: .constant(TimerModel.testData[0].data))
    }
}
