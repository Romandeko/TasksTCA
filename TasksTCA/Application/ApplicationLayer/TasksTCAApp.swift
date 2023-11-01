//
//  TasksTCAApp.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 25.10.23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TasksTCAApp: App {
    
    // MARK: - App
    
    var body: some Scene {
        WindowGroup {
            MainView(
                store: Store(
                    initialState: MainState(),
                    reducer: MainReducer()
                )
            )
        }
    }
}

