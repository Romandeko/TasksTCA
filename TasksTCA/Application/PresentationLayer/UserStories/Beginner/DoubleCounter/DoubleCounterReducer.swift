//
//  DoubleCounterReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import TCA

// MARK: - DoubleCounterReducer

public struct DoubleCounterReducer: ReducerProtocol {
    
    // MARK: - ReducerProtocol
    
    public var body: some ReducerProtocol<DoubleCounterState, DoubleCounterAction> {
        Scope(state: \.firstCounter, action: /DoubleCounterAction.firstCounter) {
            CounterReducer()
        }
        Scope(state: \.secondCounter, action: /DoubleCounterAction.secondCounter) {
            CounterReducer()
        }
        Reduce { state, action in
            switch action {
            case .firstCounter(.incrementButtonTapped), .firstCounter(.decrementButtonTapped):
                state.firstCounterValues += " \(state.firstCounter.resultNumber)"
            case .secondCounter(.incrementButtonTapped), .secondCounter(.decrementButtonTapped):
                state.secondCounterValues +=  " \(state.secondCounter.resultNumber)"
            }
            return .none
        }
    }
}


