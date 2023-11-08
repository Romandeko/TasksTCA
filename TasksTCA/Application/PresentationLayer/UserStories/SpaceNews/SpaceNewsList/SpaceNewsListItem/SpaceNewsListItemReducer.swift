//
//  SpaceNewsListItemReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ComposableArchitecture

// MARK: - SpaceNewsListItemReducer

public struct SpaceNewsListItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<SpaceNewsListItemState, SpaceNewsListItemAction> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
