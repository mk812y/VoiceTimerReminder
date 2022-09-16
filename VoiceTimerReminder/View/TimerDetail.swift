//
//  TimerDetail.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 08.09.2022.
//

import SwiftUI

struct TimerDetail: View {
    
    var timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    @State var counter: Int = 0 // при старте таймера начинаем считать секунды
    var duration = 5 // ставим счетчик в секундах
    
    func timerUp() {
        counter += 1
        if counter == duration {
            timer.upstream.connect().cancel()
            print(counter)
        }
    }
    
    var body: some View {
        Text("Hello, World!")
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
