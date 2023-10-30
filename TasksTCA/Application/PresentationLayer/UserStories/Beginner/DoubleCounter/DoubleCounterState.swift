//
//  DoubleCounterState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import Foundation

// MARK: - DoubleCounterState

public struct DoubleCounterState: Equatable {
    
    // MARK: - Properties
    
    /// Sum of counters values
    public var sumOfCountersValues: Int {
        firstCounter.resultNumber + secondCounter.resultNumber
    }
    
    /// String of first counter values
    public var firstCounterValues = "0"
    
    /// String of second counter values
    public var secondCounterValues = "0"
    
    // MARK: - Children
    
    /// An instance of 'counter' submodule
    public var firstCounter = CounterState()
    
    /// An instance of 'counter' submodule
    public var secondCounter = CounterState()

}

