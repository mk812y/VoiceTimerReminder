////
////  TimerStore.swift
////  VoiceTimerReminder
////
////  Created by Михаил Куприянов on 13.09.2022.
////
//
//import Foundation
//import SwiftUI
//
//class TimerStore: ObservableObject {
//    @Published var timers: [TimerModel] = []
//
//    private static func fileURL() throws -> URL {
//        try FileManager.default.url(for: .documentDirectory,
//                                       in: .userDomainMask,
//                                       appropriateFor: nil,
//                                       create: false)
//            .appendingPathComponent("timers.data")
//    }
//
//        static func load() async throws -> [TimerModel] {
//            try await withCheckedThrowingContinuation { continuation in
//                load { result in
//                    switch result {
//                    case .failure(let error):
//                        continuation.resume(throwing: error)
//                    case .success(let timers):
//                        continuation.resume(returning: timers)
//                    }
//                }
//            }
//        }
//
//    static func load(completion: @escaping (Result<[TimerModel], Error>)->Void) {
//        DispatchQueue.global(qos: .background).async {
//            do {
//                let fileURL = try fileURL()
//                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
//                    DispatchQueue.main.async {
//                        completion(.success([]))
//                    }
//                    return
//                }
//                let timers = try JSONDecoder().decode([TimerModel].self, from: file.availableData)
//                DispatchQueue.main.async {
//                    completion(.success(timers))
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
//
//    @discardableResult
//    static func save(timers: [TimerModel]) async throws -> Int {
//        try await withCheckedThrowingContinuation { continuation in
//            save(timers: timers) { result in
//                switch result {
//                case .failure(let error):
//                    continuation.resume(throwing: error)
//                case .success(let timersSaved):
//                    continuation.resume(returning: timersSaved)
//                }
//            }
//        }
//    }
//
//    static func save(timers: [TimerModel], completion: @escaping (Result<Int, Error>)->Void) {
//        DispatchQueue.global(qos: .background).async {
//            do {
//                let data = try JSONEncoder().encode(timers)
//                let outfile = try fileURL()
//                try data.write(to: outfile)
//                DispatchQueue.main.async {
//                    completion(.success(timers.count))
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    completion(.failure(error))
//                }
//            }
//        }
//    }
// }
