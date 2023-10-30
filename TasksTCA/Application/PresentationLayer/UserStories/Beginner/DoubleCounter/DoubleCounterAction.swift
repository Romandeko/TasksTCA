//
//  DoubleCounterAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import Foundation

// MARK: - DoubleCounterAction

public enum DoubleCounterAction: Equatable {
    
    // MARK: - Children
    
    /// Actions of child module 'Counter'
    case firstCounter(CounterAction)
    
    /// Actions of child module 'Counter'
    case secondCounter(CounterAction)
}
