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
                ForEach(viewStore.sectionSymbolsArray, id: \.self) { sectionSymbol in
                    Section(header: Text(sectionSymbol)) {
                        ForEachStore(
                            store.scope(
                                state: {
                                    $0.items.filter { $0.title.hasPrefix(sectionSymbol) }
                                },
                                action: InteractiveListAction.item(id:action:)
                            ),
                            content: InteractiveListItemView.init
                        )
                        .onDelete { indexToDelete in
                            viewStore.send(
                                .delete(
                                    indexToDelete,
                                    sectionSymbol
                                ),
                                animation: .default
                            )
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewStore.send(.addRandom, animation: .default)
                    } label: {
                        Text("Add")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

// MARK: - Preview

struct InteractiveListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InteractiveListView(
                store: Store(
                    initialState: InteractiveListState(),
                    reducer: InteractiveListReducer()
                )
            )
        }
    }
}
