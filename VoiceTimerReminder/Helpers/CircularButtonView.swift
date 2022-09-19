//
//  CircularButtonView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 19.09.2022.
//

import SwiftUI

struct CircularButtonView: View {
    var width: CGFloat
    
    var body: some View {
        Circle()
            .fill(.green)
            .frame(width: width)
            .overlay(
                Text("Start")
                    .font(.headline)
                    .foregroundColor(.white)
            )
    }
}

struct CircularButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircularButtonView(width: 80)
    }
}
