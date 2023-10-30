//
//  CounterReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import Foundation
import ComposableArchitecture

// MARK: - CounterReducer

public struct CounterReducer: Reducer {
    
    // MARK: - Reducer
    
    public func reduce(into state: inout CounterState, action: CounterAction) -> Effect<CounterAction> {
        switch action {
        case .decrementButtonTapped:
            state.resultNumber -= 1
        case .incrementButtonTapped:
            state.resultNumber += 1
        }
        return .none
    }
}

