//
//  InteractiveListAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import Foundation

// MARK: - InteractiveListAction

public enum InteractiveListAction: Equatable {
    
    // MARK: - Cases
    
    /// On appear action
    case onAppear
    
    /// Update the list of items
    case updateItems
    
    /// Add random item to the list
    case addRandom
    
    /// Remove all checked items from the list
    case removeCheckedItems
    
    /// Delete items with given indexes
    case delete(IndexSet, String)
    
    // MARK: - Children
    
    /// Item action
    case item(id: UUID, action: InteractiveListItemAction)
}
