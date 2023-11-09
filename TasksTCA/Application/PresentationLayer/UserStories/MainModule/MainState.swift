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
    
    public enum ModuleType: Equatable, CaseIterable, Hashable {
        public static var allCases: [MainState.ModuleType] {
            Beginner.allCases.map{.beginner($0)} + Intermediate.allCases.map{.intermediate($0)}
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
    
    /// Array of all  modules
    public let beginnerModuleTypes = ModuleType.Beginner.allCases.map{$0}
    
    /// How many each beginner module was appeared dictionary
    public var modulesInfo = [ModuleType:Int](
        uniqueKeysWithValues: ModuleType.allCases.map { ($0, 0) }
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
    
    public var moduleItemInfoText: (ModuleType) -> String {
        { moduleType in
            let count = modulesInfo[moduleType, default: 0]
            return count == 0 ? "" : "\(count)"
        }
    }
}

