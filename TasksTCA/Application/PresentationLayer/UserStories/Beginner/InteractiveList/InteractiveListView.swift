//
//  InteractiveListView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 2.11.23.
//

import SwiftUI
import ComposableArchitecture

// MARK: - InteractiveListView

public struct InteractiveListView: View {
    
    // MARK: - Properties
    
    /// The store powerind `InteractiveList` Reducer
    public let store: StoreOf<InteractiveListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                ForEachStore(
                    store.scope(
                        state: \.items,
                        action: InteractiveListAction.item(id:action:)
                    ),
                    content: InteractiveListItemView.init
                )
                .onDelete { indexToDelete in
                    viewStore.send(.delete(indexToDelete))
                }
            }
            .navigationBarItems(trailing:
                Button {
                   viewStore.send(.addRandom, animation: .default)
                } label: {
                    Text("Add")
                     .foregroundColor(.black)
                     .font(.system(size: 20))
                }
            )
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

// MARK: - Preview

struct InteractiveListView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveListView(
            store: Store(
                initialState: InteractiveListState(),
                reducer: InteractiveListReducer()
            )
        )
    }
}
