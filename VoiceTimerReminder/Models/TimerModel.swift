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
    var timeElapsedInSeconds: Int
    var timeLengthInSeconds: Int
    
    init(id: UUID = UUID(), title: String, timeElapsedinSeconds: Int, timeLengthInSeconds: Int) {
        self.id = id
        self.title = title
        self.timeElapsedInSeconds = timeElapsedinSeconds
        self.timeLengthInSeconds = timeLengthInSeconds
    }
}

extension TimerModel {
    
    struct Data {
        var title: String = "Timer1"
        var timeElapsedInSeconds: Int = 0
        var timeLenghtInSeconds: Int = 5400
    }
    
    var data: Data {
        Data(title: title, timeElapsedInSeconds: timeElapsedInSeconds, timeLenghtInSeconds: timeLengthInSeconds)
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        timeElapsedInSeconds = data.timeElapsedInSeconds
        timeLengthInSeconds = data.timeLenghtInSeconds
    }
    
    static let testData: [TimerModel] =
    [
        TimerModel(title: "Гладить котеек", timeElapsedinSeconds: 209221, timeLengthInSeconds: 5400),
        TimerModel(title: "lerning SwiftUI", timeElapsedinSeconds: 0, timeLengthInSeconds: 72000),
        TimerModel(title: "кушоть", timeElapsedinSeconds: 430, timeLengthInSeconds: 73451)//,
//        TimerModel(title: "Гладить котеек два", timeElapsedinSeconds: 23421, timeLengthInSeconds: 23421),
//        TimerModel(title: "Смотреть на котеек", timeElapsedinSeconds: 30, timeLengthInSeconds: 209221)
    ]
}
