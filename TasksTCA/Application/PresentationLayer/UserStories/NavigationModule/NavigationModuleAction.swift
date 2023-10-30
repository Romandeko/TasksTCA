//
//  NavigationModuleAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation

// MARK: - NavigationModuleAction

public enum NavigationModuleAction: Equatable {
    
    // MARK: - Children
    
    /// Actions of child module 'Counter'
    case counterModuleAction(CounterAction)
    
    /// Actions of child module 'FibonacciCounter'
    case fiboCounterModuleAction(FibonacciCounterAction)
    
    /// Actions of child module 'DoubleCounter'
    case doubleCounterModuleAction(DoubleCounterAction)
    
    /// Actions of child module 'Bindings'
    case bindingsModuleAction(BindingsAction)
    
    // MARK: - Navigation
    
    /// Setter for 'isCounterModuleActive' property binding
    case setCounterModuleActive(Bool)
    
    /// Setter for 'isFiboCounterModuleActive' property binding
    case setFiboCounterModuleActive(Bool)
    
    /// Setter for 'isDoubleCounterModuleActive' property binding
    case setDoubleCounterModuleActive(Bool)
    
    /// Setter for 'isBindingsModuleActive' property binding
    case setBindingsModuleActive(Bool)
}
