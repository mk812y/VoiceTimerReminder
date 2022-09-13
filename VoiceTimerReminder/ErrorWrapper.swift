//
//  ErrorWrapper.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 13.09.2022.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String

    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
