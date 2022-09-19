//
//  TimerDetail.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 08.09.2022.
//

import SwiftUI

struct TimerDetail: View {
    
    var timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State var isStart = false
    
    @State var counter: Int = 0 // при старте таймера начинаем считать секунды
    var duration = 5 // ставим счетчик в секундах
    
    func timerUp() {
        
        if counter < duration || isStart {
            counter += 1
            
            print(counter)
        } else {
            timer.upstream.connect().cancel()
        }
    }
    
    var timeString: String {
        let formatter = DateComponentsFormatter()
        return formatter.string(from: TimeInterval(counter)) ?? "00:00"
    }
    
    
    
    var body: some View {
        VStack {
            Text(timeString)
            Button(action: {
                isStart = true
                
            }) {
                Label("Boobs", systemImage: "plus")
            }
        }
            .onReceive(timer) { time in //
                timerUp()
                print("\(time) time") // up every sec -> 2022-09-16 11:01:00 +0000 time
            }
    }
}

struct TimerDetail_Previews: PreviewProvider {
    static var previews: some View {
        TimerDetail()
    }
}
