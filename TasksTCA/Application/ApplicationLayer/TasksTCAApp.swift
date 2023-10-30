//
//  TasksTCAApp.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 25.10.23.
//

import SwiftUI
import TCA

@main
struct TasksTCAApp: App {
    
    // MARK: - App
    
    var body: some Scene {
        WindowGroup {
            FibonacciCounterView(
                store: Store(
                    initialState: FibonacciCounterState(),
                    reducer: FibonacciCounterReducer()
                )
            )
        }
    }
}

