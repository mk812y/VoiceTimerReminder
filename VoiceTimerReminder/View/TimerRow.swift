//
//  TimerRow.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 07.09.2022.
//

import SwiftUI

struct TimerRow: View {
    let timerItem: TimerModel
    let timer = Timer.publish(every: 1.0, tolerance: 0.1, on: .main, in: .common).autoconnect()
    @State var isStart: Bool = false
    
    @State var upCount: Int = 0
    
    func updateTime(time: Int, countUP: Bool) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval( countUP ? time + upCount : time - upCount)) ?? "00:00:00"
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
                        updateTime(time: timerItem.timeElapsedInSeconds, countUP: true),
                        systemImage: "hourglass.bottomhalf.fill"
                    )
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Label(
                        updateTime(time: timerItem.timeLengthInSeconds, countUP: false),
                        systemImage: "hourglass.tophalf.fill"
                    )
                }
            }
            Button(action: {
                isStart.toggle()
            }) {
                Text(isStart ? "stop": "start")
            }
            .font(.title)
        }
        .onReceive(timer) { _ in
            if isStart { upCount += 1 }
        }
    }
}

struct TimerRow_Previews: PreviewProvider {
    static var previews: some View {
        TimerRow(timerItem: TimerModel.testData[1])
    }
}
