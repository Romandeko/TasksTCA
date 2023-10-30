//
//  CounterAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 26.10.23.
//

import Foundation

// MARK: - CounterAction

public enum CounterAction: Equatable {
    
    // MARK: - Cases
    
    /// Decrements result number
    case decrementButtonTapped
    
    /// Increments result number
    case incrementButtonTapped
}
