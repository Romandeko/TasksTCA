//
//  CounterReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import Foundation
import TCA

// MARK: - CounterReducer

public struct CounterReducer: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public func reduce(into state: inout CounterState, action: CounterAction) -> EffectTask<CounterAction> {
        switch action {
        case .decrementButtonTapped:
            state.resultNumber -= 1
        case .incrementButtonTapped:
            state.resultNumber += 1
        }
        return .none
    }
}

