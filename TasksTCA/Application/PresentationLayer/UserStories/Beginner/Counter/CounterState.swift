//
//  CounterState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import Foundation

// MARK: - CounterState

public struct CounterState: Equatable {
    
    // MARK: - Properties
    
    /// Result number
    public var resultNumber = 1
    
    /// If increment button is disabled
    public var isIncrementDisabled: Bool {
        resultNumber > 14
    }
    
    /// If decrement button is disabled
    public var isDecrementDisabled: Bool {
        resultNumber < 2
    }
}
