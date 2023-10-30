//
//  CounterState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 25.10.23.
//

import Foundation

// MARK: - FibonacciCounterState

public struct FibonacciCounterState: Equatable {
    
    // MARK: - Properties
    
    /// Fibonacci number
    public var fiboNumber = 1
    
    /// If reset button is disabled
    public var isResetDisabled: Bool {
        counter.resultNumber == 1
    }
    
    // MARK: - Children
    
    /// An instance of 'counter' submodule
    public var counter = CounterState()
}
