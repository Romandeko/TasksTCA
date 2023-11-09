//
//  MainAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 30.10.23.
//

import Foundation

// MARK: - MainAction

public enum MainAction: Equatable {
    
    // MARK: - General
    
    /// Actions for all beginner modules
    case onBeginnerModuleItemTap(MainState.ModuleType.BeginnerModules)
    
    /// Actions for all intermediate modules
    case onIntermediateModuleItemTap(MainState.ModuleType.IntermediateModules)
    
    // MARK: - Children
    
    /// Actions of child module `Counter`
    case counter(CounterAction)
    
    /// Actions of child module `FibonacciCounter`
    case fibonacciCounter(FibonacciCounterAction)
    
    /// Actions of child module `DoubleCounter`
    case doubleCounter(DoubleCounterAction)
    
    /// Actions of child module `Bindings`
    case bindings(BindingsAction)
    
    /// Actions of child module `InteractiveList`
    case interactiveList(InteractiveListAction)
    
    /// Actions of child module `FirstSpaceNewsList`
    case firstSpaceNewsList(SpaceNewsListAction)
    
    /// Actions of child module `SecondSpaceNewsList`
    case secondSpaceNewsList(SpaceNewsListAction)
    
    // MARK: - Navigation
    
    /// Setter for `isCounterActive` property binding
    case setCounterActive(Bool)
    
    /// Setter for '`sFiboCounterActive` property binding
    case setFiboCounterActive(Bool)
    
    /// Setter for `isDoubleCounterActive` property binding
    case setDoubleCounterActive(Bool)
    
    /// Setter for `isBindingsMActive'` property binding
    case setBindingsActive(Bool)
    
    /// Setter for `isInteractiveListActive'` property binding
    case setInteractiveListActive(Bool)
    
    /// Setter for `isFirstSpaceNewsListActive'` property binding
    case setFirstSpaceNewsListActive(Bool)
    
    /// Setter for `isSecondSpaceNewsListActive'` property binding
    case setSecondSpaceNewsListActive(Bool)
}
