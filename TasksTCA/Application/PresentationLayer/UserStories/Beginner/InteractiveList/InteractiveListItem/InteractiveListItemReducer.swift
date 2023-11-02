//
//  InteractiveListItemReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import ComposableArchitecture

// MARK: - InteractiveListItemReducer

public struct InteractiveListItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListItemState, InteractiveListItemAction> {
        Reduce { state, action in
            switch action {
            case .checkBoxToggled:
                state.isChecked.toggle()
                return .none
            }
        }
    }
}
