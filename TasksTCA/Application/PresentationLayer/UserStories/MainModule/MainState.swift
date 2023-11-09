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
        
        // MARK: - BeginnerModules
        
        public enum BeginnerModules: Equatable, CaseIterable {
            
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
       
        // MARK: - IntermediateModules
        
        public enum IntermediateModules: Equatable, CaseIterable {
            
            // MARK: - Cases
            
            case interactiveList
            case firstSpaceNewsList
            case secondSpaceNewsList
            
            // MARK: - Useful
            
            public var title: String {
                switch self {
                case .interactiveList:
                    return "Interactive list"
                case .firstSpaceNewsList:
                    return "News with instant transition"
                case .secondSpaceNewsList:
                    return "News with deffered transition"
                }
            }
        }
    }
    
    // MARK: - Properties
    
    /// Array of all  beginnermodules
    public let beginnerModuleTypes = ModuleType.BeginnerModules.allCases
    
    /// Array of all  intermediate modules
    public let intermediateModuleTypes = ModuleType.IntermediateModules.allCases
    
    /// How many each beginner module was appeared dictionary
    public var beginnerModulesInfo = [ModuleType.BeginnerModules:Int](
        uniqueKeysWithValues: ModuleType.BeginnerModules.allCases.map { ($0, 0) }
    )

    /// How many each intermediate module was appeared dictionary
    public var intermediateModulesInfo = [ModuleType.IntermediateModules:Int](
        uniqueKeysWithValues: ModuleType.IntermediateModules.allCases.map { ($0, 0) }
    )
    
    // MARK: - Children
    
    /// An instance of `counter` submodule
    public var counter: CounterState? 
    
    /// An instance of `fibonacciCounter` submodule
    public var fiboCounter: FibonacciCounterState?
    
    /// An instance of `doubleCounter` submodule
    public var doubleCounter: DoubleCounterState?
    
    /// An instance of `bindings`' submodule
    public var bindings: BindingsState?
    
    /// An instance of `interactiveList`' submodule
    public var interactiveList: InteractiveListState?
    
    /// An instance of `spaceNewsList`' submodulec with instant transition
    public var firstSpaceNewsList: SpaceNewsListState?
    
    /// An instance of `spaceNewsList`' submodule with deffered transition
    public var secondSpaceNewsList: SpaceNewsListState?
    
    // MARK: - Navigation
    
    /// If counter module is active
    public var isCounterActive = false
    
    /// If fibonacci counter module is active
    public var isFiboCounterActive = false
    
    /// If double counter module is active
    public var isDoubleCounterActive = false
    
    /// If bindings module is active
    public var isBindingsActive = false
    
    /// If interactiveList module is active
    public var isInteractiveListActive = false
    
    /// If firstSpaceNewsList module is active
    public var isFirstSpaceNewsListActive = false
    
    /// If secondSpaceNewsList module is active
    public var isSecondSpaceNewsListActive = false
}

// MARK: - Text

extension MainState {
    
    public var beginnerModuleItemInfoText: (ModuleType.BeginnerModules) -> String {
        { moduleType in
            let count = beginnerModulesInfo[moduleType, default: 0]
            return count == 0 ? "" : "Appearances count: \(count)"
        }
    }
    
    public var intermediateModuleItemInfoText: (ModuleType.IntermediateModules) -> String {
        { moduleType in
            let count = intermediateModulesInfo[moduleType, default: 0]
            return count == 0 ? "" : "Appearances count: \(count)"
        }
    }
}

