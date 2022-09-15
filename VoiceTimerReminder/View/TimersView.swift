//
//  TimersView.swift
//  VoiceTimerReminder
//
//  Created by Михаил Куприянов on 06.09.2022.
//

import SwiftUI
//буду переделывать на Core Data

struct TimersView: View {
    @Environment(\.scenePhase) private var scenePhase
    @Binding var timerItems: [TimerModel]
    @State private var newTimerData = TimerModel.Data()
    @State private var isShowTimerAddNew = false
//    let saveAction: ()->Void
    
    var body: some View {
        List {
            ForEach(timerItems) { timerItem in
                NavigationLink(destination: TimerDetail()) {
                    TimerRow(timerItem: timerItem)
                }
            }
        }
        .navigationTitle("Timers")
        .toolbar {
            Button(action: { isShowTimerAddNew = true }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isShowTimerAddNew) {
            NavigationView {
                TimerAddNew(data: $newTimerData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Back") {
                                isShowTimerAddNew = false
                                newTimerData = TimerModel.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newTimer = TimerModel(data: newTimerData)
                                print(newTimer)
                                timerItems.append(newTimer)
                                isShowTimerAddNew = false
                                newTimerData = TimerModel.Data()
                            }
                        }
                    }
            }
        }
//        .onChange(of: scenePhase) { phase in
//            if phase == .inactive { saveAction() }
//        }
    }
}

struct TimersView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
//            TimersView(timerItems: .constant(TimerModel.testData), saveAction: {})
            TimersView(timerItems: .constant(TimerModel.testData))
        }
        
    }
}
