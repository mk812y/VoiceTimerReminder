//
//  TimerProgressViewStyle.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 07.09.2022.
//

import SwiftUI

struct TimerProgressViewStyle: ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray5))
                .frame(height: 20)
            ProgressView(configuration)
                .tint(.white)
                .frame(height: 12)
                .padding(.horizontal)
        }
    }
}

struct TimerProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.5)
            .progressViewStyle(TimerProgressViewStyle())
    }
}
