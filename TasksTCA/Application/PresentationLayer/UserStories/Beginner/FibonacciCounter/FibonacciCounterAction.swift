//
//  CounterAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 25.10.23.
//

import Foundation

// MARK: - FibonacciCounterAction

public enum FibonacciCounterAction: Equatable {
    
    // MARK: - General
    
    /// Sets fibonacci number and fibonacci index to zero
    case resetButtonTapped
    
    // MARK: - Children
    
    /// Actions of child module 'Counter'
    case counter(CounterAction)
}
