//
//  TimerRow.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 07.09.2022.
//

import SwiftUI

struct TimerRow: View {
    let timerItem: TimerModel
    
    private func timeSecondFormatter(timeInSeconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        return formatter.string(from: TimeInterval(timeInSeconds)) ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(timerItem.title)")
                .font(.headline)
            ProgressView(value: 0.9)
                .progressViewStyle(TimerProgressViewStyle())
            HStack {
                VStack(alignment: .leading) {
                    Label(
                        timeSecondFormatter(timeInSeconds: timerItem.timeElapsedInSeconds),
                        systemImage: "hourglass.bottomhalf.fill"
                    )
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Label(
                        timeSecondFormatter(timeInSeconds: timerItem.timeLengthInSeconds),
                        systemImage: "hourglass.tophalf.fill"
                    )
                    .labelStyle(.trailingIcon)
                }
            }
        }
    }
}

struct TimerRow_Previews: PreviewProvider {
    static var previews: some View {
        TimerRow(timerItem: TimerModel.testData[0])
    }
}
