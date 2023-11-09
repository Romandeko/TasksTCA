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
        public static var allCases: [MainState.ModuleType] {
            [.beginner(.counter)]
        }
        
        // MARK: - Cases
        
        case beginner(Beginner)
        case intermediate(Intermediate)
        
        // MARK: - Beginner
        
        public enum Beginner: String, Equatable, CaseIterable {
            
            // MARK: - Cases
            
            case counter = "Counter"
            case fiboCounter = "Fibonacci counter"
            case doubleCounter = "Double counter"
            case bindings = "Bindings"
        }
       
        // MARK: - Intermediate
        
        public enum Intermediate: String, Equatable, CaseIterable {
            
            // MARK: - Cases
            
            case interactiveList = "Interactive list"
            case firstSpaceNewsList = "News with instant transition"
            case secondSpaceNewsList = "News with deffered transition"
        }
    }
    
    // MARK: - Properties
    
    /// Array of all  beginnermodules
    public let beginnerModuleTypes = ModuleType.Beginner.allCases
    
    /// Array of all  intermediate modules
    public let intermediateModuleTypes = ModuleType.Intermediate.allCases
    
    /// How many each beginner module was appeared dictionary
    public var beginnerModulesInfo = [ModuleType.Beginner:Int](
        uniqueKeysWithValues: ModuleType.Beginner.allCases.map { ($0, 0) }
    )

    /// How many each intermediate module was appeared dictionary
    public var intermediateModulesInfo = [ModuleType.Intermediate:Int](
        uniqueKeysWithValues: ModuleType.Intermediate.allCases.map { ($0, 0) }
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
    
    public var beginnerModuleItemInfoText: (ModuleType.Beginner) -> String {
        { moduleType in
            let count = beginnerModulesInfo[moduleType, default: 0]
            return count == 0 ? "" : "\(count)"
        }
    }
    
    public var intermediateModuleItemInfoText: (ModuleType.Intermediate) -> String {
        { moduleType in
            let count = intermediateModulesInfo[moduleType, default: 0]
            return count == 0 ? "" : "\(count)"
        }
    }
}

