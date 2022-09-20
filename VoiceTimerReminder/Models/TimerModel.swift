//
//  TimerModel.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 07.09.2022.
//

import Foundation

struct TimerModel: Identifiable, Codable {
    let id: UUID
    var title: String
    var elapsedTimer: Int
    var goalTimer: Int
    
    init(id: UUID = UUID(), title: String, elapsedTimer: Int, goalTimer: Int) {
        self.id = id
        self.title = title
        self.elapsedTimer = elapsedTimer
        self.goalTimer = goalTimer
    }
}

extension TimerModel {
    
    struct Data {
        var title: String = "Timer1"
        var elapsedTimer: Int = 0
        var goalTimer: Int = 5400
    }
    
    var data: Data {
        Data(title: title, elapsedTimer: elapsedTimer, goalTimer: goalTimer)
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        elapsedTimer = data.elapsedTimer
        goalTimer = data.goalTimer
    }
    
    static let testData: [TimerModel] =
    [
        TimerModel(title: "Гладить котеек", elapsedTimer: 209221, goalTimer: 5400),
        TimerModel(title: "lerning SwiftUI", elapsedTimer: 120, goalTimer: 240),
        TimerModel(title: "кушоть", elapsedTimer: 0, goalTimer: 7200)
//        TimerModel(title: "Гладить котеек два", timeElapsedinSeconds: 23421, goalTimer: 23421),
//        TimerModel(title: "Смотреть на котеек", timeElapsedinSeconds: 30, timeLengthInSeconds: 209221)
    ]
}
