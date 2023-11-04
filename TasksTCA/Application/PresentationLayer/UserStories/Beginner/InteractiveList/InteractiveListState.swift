//
//  InteractiveListState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import ComposableArchitecture

// MARK: - InteractiveListState

public struct InteractiveListState: Equatable {
    
    // MARK: - Properties
    
    /// Array of  unique first symbols of items titles
    public var sectionSymbolsArray: [String] {
        Set(items.map( { String($0.title.prefix(1)) } )).sorted()
    }
    
    // MARK: - Children
    
    /// Array of identified items
    public var items = IdentifiedArrayOf<InteractiveListItemState>()
}
