//
//  CircularProgressView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 19.09.2022.
//

import SwiftUI

struct CircularProgressView: View {
    var width: CGFloat
    var lineWidth: CGFloat
    var progress: CGFloat
    var foregroundColor: Color
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: width)
            .overlay(
                Circle()
                    .stroke(Color(.secondarySystemBackground), lineWidth: lineWidth)
            )
            .overlay(overlayCircle)
    }
    
    private var overlayCircle: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: width)
            .overlay(
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round,
                        lineJoin: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(foregroundColor)
                
            )
        
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(width: 60, lineWidth: 10, progress: 0.8, foregroundColor: Color(.systemGreen))
            
    }
}



