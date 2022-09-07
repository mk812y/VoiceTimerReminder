//
//  TimerView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 07.09.2022.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.headline)
            ProgressView(value: 0.9)
                .progressViewStyle(TimerProgressViewStyle())
            HStack {
                VStack(alignment: .leading) {
                    Label("02:29", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Label("04:31", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
