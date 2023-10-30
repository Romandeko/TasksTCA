//
//  CounterFeature.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 25.10.23.
//

import ComposableArchitecture

// MARK: - FibonacciCounterReducer

public struct FibonacciCounterReducer: Reducer {
    
    // MARK: - Private
    
    /// Calculates fibonacci number with given index
    private func fibonacci(_ index: Int) -> Int {
        if index == 0 { return 0 }
        if index == 1 { return 1 }
        return fibonacci(index - 1) + fibonacci(index - 2)
    }
    
    // MARK: - Reducer
    
    public var body: some Reducer<FibonacciCounterState, FibonacciCounterAction> {
        Scope(state: \.counter, action: /FibonacciCounterAction.counter) {
            CounterReducer()
        }
        Reduce { state, action in
            switch action {
            case .counter(.incrementButtonTapped), .counter(.decrementButtonTapped):
                state.fiboNumber = fibonacci(state.counter.resultNumber)
            case .resetButtonTapped:
                state.counter.resultNumber = 1
                state.fiboNumber = 1
            }
            return .none
        }
    }
}
