//
//  SpaceNewsListState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ComposableArchitecture

// MARK: - SpaceNewsListState

public struct SpaceNewsListState: Equatable {
    
    // MARK: - Transition
    
    /// Types of transition
    public enum Transiton {
        
        // MARK: - Cases
        
        case deferred
        case instant
    }
    
    // MARK: - Properties
    
    /// Current type of transition
    public var transitionType: Transiton
    
    // MARK: - Children
    
    /// Array of identified items
    public var items = IdentifiedArrayOf<SpaceNewsListItemState>()
    
    /// An instance of `spaceNewsPage`' submodule
    public var newsPage: SpaceNewsPageState?
    
    // MARK: - Navigation
    
    /// If newsPage module is active
    public var isNewsPageActive = false
}
