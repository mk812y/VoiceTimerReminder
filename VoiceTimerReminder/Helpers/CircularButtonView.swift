//
//  CircularButtonView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 19.09.2022.
//

import SwiftUI

struct CircularButtonView: View {
    
    enum ButtonStyle {
        case start
        case stop
//        case pause
        
        var title: String {
            switch self {
            case .start:
                return "Start"
            case .stop:
                return "Stop"
            }
        }
        
        var fillColor: Color {
            switch self {
            case .start:
                return Color(.systemGreen)
            case .stop:
                return Color(.orange)
            }
        }
        
        var foregroundColor: Color {
            switch self {
            case .start:
                return Color(.white)
            case .stop:
                return Color(.white)
            }
        }

    }
    var style: ButtonStyle
    var width: CGFloat
    
    var body: some View {
        Circle()
            .fill(style.fillColor)
            .frame(width: width)
            .overlay(
                Text(style.title)
                    .font(.headline)
                    .foregroundColor(style.foregroundColor)
            )
    }
}

struct CircularButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircularButtonView(style: .start, width: 80)
    }
}
