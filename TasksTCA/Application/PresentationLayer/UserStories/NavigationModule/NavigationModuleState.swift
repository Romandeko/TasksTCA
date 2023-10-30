//
//  NavigationModuleState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation

// MARK: - NavigationModuleState

public struct NavigationModuleState: Equatable {
    
    // MARK: - Properties
    
    /// How many each module was appeared array
    public var modulesAppearanceArray = [0,0,0,0]
        
    /// How many each module was appeared string array
    public var modulesAppearanceStringArray : [String] {
        modulesAppearanceArray.map { $0 == 0 ? "" : String($0) }
    }
    
    // MARK: - Children
    
    /// An instance of 'counter' submodule
    public var CounterModule = CounterState()
    
    /// An instance of 'fibonacciCounter' submodule
    public var FiboCounterModule = FibonacciCounterState()
    
    /// An instance of 'doubleCounter' submodule
    public var DoubleCounterModule = DoubleCounterState()
    
    /// An instance of 'bindings'' submodule
    public var BindingsModule = BindingsState()
    
    // MARK: - Navigation
    
    /// If counter module is active
    public var isCounterModuleActive = false
    
    /// If fibonacci counter module is active
    public var isFiboCounterModuleActive = false
    
    /// If double counter module is active
    public var isDoubleCounterModuleActive = false
    
    /// If bindings module is active
    public var isBindingsModuleActive = false
}
