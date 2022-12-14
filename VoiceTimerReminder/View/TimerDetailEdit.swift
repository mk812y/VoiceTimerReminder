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
    
    var testTime = "28:30"
    
    
    
    private var convertValue: Int {
        return data.goalTimer / 60
    }
    
    private var valueInHours: Int {
        return (data.goalTimer / 60) / 60
    }
    
    private var valueInHours2: Int {
        return (data.goalTimer / 60) % 60
    }
    
    var body: some View {
        Form {
            Section(header: Text("Timer")) {
                TextField("Name", text: $data.title)
                Text("\(data.goalTimer) -> \(convertValue)")
                Text("\(valueInHours) hr : \(valueInHours2) min")
            }
        }
    }
}

struct TimerDetailEdit_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TimerDetailEdit(data: .constant(TimerModel.testData[0].data))
            TimerDetailEdit(data: .constant(TimerModel.testData[1].data))
            TimerDetailEdit(data: .constant(TimerModel.testData[2].data))
        }
    }
}
