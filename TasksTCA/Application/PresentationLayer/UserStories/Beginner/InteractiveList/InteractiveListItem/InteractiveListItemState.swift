//
//  InteractiveListItemState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import Foundation

// MARK: - InteractiveListItemState

public struct InteractiveListItemState: Identifiable, Equatable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public let id: UUID
    
    /// Title valuse
    public let title: String
    
    /// Image name
    public let image: String
    
    /// Hex color
    public let color: String
    
    /// If current item is checked
    public var isChecked = false
}

// MARK: - Random

extension InteractiveListItemState {
    
    /// Generates random InteractiveListItemState
    /// - Returns: random InteractiveListItemState
    public static func random() -> InteractiveListItemState {
         let colors = [
            "#CDA08B",
            "#324232",
            "#FF748C",
            "#509FD4",
            "#FF3848"
        ]
         let images = [
            "drop",
            "mustache.fill",
            "hand.thumbsdown",
            "pencil",
            "house"
        ]
        let randomString = UUID().uuidString.suffix(8)
        return InteractiveListItemState(
            id: UUID(),
            title: String(randomString),
            image: images.randomElement().unsafelyUnwrapped,
            color: colors.randomElement().unsafelyUnwrapped
        )
    }
    
    /// Generates array of random InteractiveListItemStates
    /// - Returns: array of random InteractiveListItemStates
    public static func randomItems() -> [InteractiveListItemState] {
         [
            InteractiveListItemState.random(),
            InteractiveListItemState.random(),
            InteractiveListItemState.random(),
            InteractiveListItemState.random(),
            InteractiveListItemState.random(),
            InteractiveListItemState.random(),
            InteractiveListItemState.random()
        ]
    }
}
