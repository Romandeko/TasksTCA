//
//  InteractiveListState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import ComposableArchitecture

// MARK: - InteractiveListState

public struct InteractiveListState: Equatable {
    
    // MARK: - Children
    
    /// Array of identified items
    public var items = IdentifiedArrayOf<InteractiveListItemState>()
}
