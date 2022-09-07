//
//  TimerModel.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 07.09.2022.
//

import Foundation

struct TimerModel: Identifiable {
    let id: UUID
    var title: String
    var timeLengthInSeconds: Int
    var timeElapsedinSeconds: Int
    
    init(id: UUID = UUID(), title: String, timeLengthInSeconds: Int, timeElapsedinSeconds: Int) {
        self.id = id
        self.title = title
        self.timeLengthInSeconds = timeLengthInSeconds
        self.timeElapsedinSeconds = timeElapsedinSeconds
    }
}

extension TimerModel {
    static let testData: [TimerModel] =
    [
        TimerModel(title: "Гладить котеек", timeLengthInSeconds: 3600, timeElapsedinSeconds: 3569),
        TimerModel(title: "lerning SwiftUI", timeLengthInSeconds: 72000, timeElapsedinSeconds: 0),
        TimerModel(title: "кушоть", timeLengthInSeconds: 73451, timeElapsedinSeconds: 430),
        TimerModel(title: "Гладить котеек два", timeLengthInSeconds: 23421, timeElapsedinSeconds: 23421),
        TimerModel(title: "Смотреть на котеек", timeLengthInSeconds: 209221, timeElapsedinSeconds: 30)
    ]
}
