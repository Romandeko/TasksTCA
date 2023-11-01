//
//  NavigationModuleAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation

// MARK: - NavigationModuleAction

public enum NavigationModuleAction: Equatable {
    
    // MARK: - General
    
    case onModuleItemTap(NavigationModuleState.ModuleType)
    
    // MARK: - Children
    
    /// Actions of child module `Counter`
    case counter(CounterAction)
    
    /// Actions of child module `FibonacciCounter`
    case fibonacciCounter(FibonacciCounterAction)
    
    /// Actions of child module `DoubleCounter`
    case doubleCounter(DoubleCounterAction)
    
    /// Actions of child module `Bindings`
    case bindings(BindingsAction)
    
    // MARK: - Navigation
    
    /// Setter for `isCounterModuleActive` property binding
    case setCounterActive(Bool)
    
    /// Setter for '`sFiboCounterModuleActive` property binding
    case setFiboCounterActive(Bool)
    
    /// Setter for `isDoubleCounterModuleActive` property binding
    case setDoubleCounterActive(Bool)
    
    /// Setter for `isBindingsModuleActive'` property binding
    case setBindingsActive(Bool)
}
