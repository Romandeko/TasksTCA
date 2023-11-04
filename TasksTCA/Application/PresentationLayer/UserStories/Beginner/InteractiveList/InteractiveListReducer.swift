//
//  InteractiveListReduce.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import Foundation
import ComposableArchitecture

// MARK: - InteractiveListReducer

public struct InteractiveListReducer: Reducer {
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    // MARK: - Reducer
    
    public var body: some Reducer<InteractiveListState, InteractiveListAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(.updateItems)
            case .updateItems:
                let randomItems = InteractiveListItemState.randomItems()
                state.items = IdentifiedArrayOf(uniqueElements: randomItems)
            case .addRandom:
                state.items.append(.random())
                state.items.sort { $0.title < $1.title }
            case .removeCheckedItems:
                state.items.removeAll(where: \.isChecked)
            case .delete(let offset, let letter):
                let symbolIndex = state.items.firstIndex(where: { String($0.title.first.unsafelyUnwrapped) == letter })
                state.items.remove(at: symbolIndex.unsafelyUnwrapped + offset.first.unsafelyUnwrapped)
            case .item(id: _, action: .checkBoxToggled):
                return .send(.removeCheckedItems)
                    .debounce(
                        id: ItemCheckingID(),
                        for: 1,
                        scheduler: DispatchQueue.main.animation()
                    )
            }
            return .none
        }
        .forEach(\.items, action: /InteractiveListAction.item(id:action:)) {
            InteractiveListItemReducer()
        }
    }
}
