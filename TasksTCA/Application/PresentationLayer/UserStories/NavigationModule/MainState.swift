//
//  MainState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation

// MARK: - MainState

public struct MainState: Equatable {
    
    // MARK: - ModuleType
    
    public enum ModuleType: Equatable, CaseIterable {
        
        // MARK: - Cases
        
        case counter
        case fiboCounter
        case doubleCounter
        case bindings
        
        // MARK: - Useful
        
        public var title: String {
            switch self {
            case .counter:
                return "Counter"
            case .fiboCounter:
                return "Fibonacci counter"
            case .doubleCounter:
                return "Double counter"
            case .bindings:
                return "Bindings"
            }
        }
    }
    
    // MARK: - Properties
    
    /// Array of all modules
    public let moduleTypes = ModuleType.allCases
    
    /// How many each module was appeared dictionary
    public var modulesInfo = [ModuleType:Int](uniqueKeysWithValues: ModuleType.allCases.map { ($0, 0) } )
    
    // MARK: - Children
    
    /// An instance of `counter` submodule
    public var counter: CounterState? = CounterState()
    
    /// An instance of `fibonacciCounter` submodule
    public var fiboCounter: FibonacciCounterState? = FibonacciCounterState()
    
    /// An instance of `doubleCounter` submodule
    public var doubleCounter: DoubleCounterState? = DoubleCounterState()
    
    /// An instance of `bindings`' submodule
    public var bindings: BindingsState? = BindingsState()
    
    // MARK: - Navigation
    
    /// If counter module is active
    public var isCounterActive = false
    
    /// If fibonacci counter module is active
    public var isFiboCounterActive = false
    
    /// If double counter module is active
    public var isDoubleCounterActive = false
    
    /// If bindings module is active
    public var isBindingsActive = false
}

// MARK: - Text

extension MainState {
    
    public var moduleItemInfoText: (ModuleType) -> String {
        { moduleType in
            let count = modulesInfo[moduleType, default: 0]
            return count == 0 ? "" : "Appearings count: \(count)"
        }
    }
}
