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
    
    @State var isRunning: Bool = false
    
    @State var count: Int = 0
    
    func timerUpdate() {
        if isRunning { count += 1 }
    }
    
    func timeFormatterToString(timeFromModel: Int, timePlusCount: Bool) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(
            from: TimeInterval(
                timePlusCount ? timeFromModel + count : timeFromModel - count
            )) ?? "00:00:00"
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(timerItem.title)")
                .font(.headline)
            ZStack {
                CircularProgressView(width: 80, lineWidth: 5, progress: 0.6, foregroundColor: Color(.systemGreen))
                    
                Button(action: { isRunning.toggle() }) {
                    CircularButtonView(
                        style: isRunning ? .stop : .start,
                        width: 60)
                }
            }
                
            HStack {
                Text(timeFormatterToString(timeFromModel: timerItem.elapsedTimer, timePlusCount: true))
                Spacer()
                Text(timeFormatterToString(timeFromModel: timerItem.goalTimer, timePlusCount: false))
            }
            Button(action: {
                isRunning.toggle()
            }) {
                Text(isRunning ? "stop": "start")
            }
            .font(.title)
        }
        .padding()
        .onReceive(timer) { _ in
            timerUpdate()
        }
    }
}

struct TimerRow_Previews: PreviewProvider {
    static var previews: some View {
        TimerRow(timerItem: TimerModel.testData[1])
            .background(Color(.systemGray6))
    }
}
