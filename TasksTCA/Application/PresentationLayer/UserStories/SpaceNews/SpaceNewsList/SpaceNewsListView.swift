//
//  SpaceNewsListView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ComposableArchitecture
import SwiftUI
import HTTPTransport

// MARK: - SpaceNewsListView

public struct SpaceNewsListView: View {
    
    // MARK: - Properties
    
    /// The store powering the `SpaceNewsList` Reducer
    public let store: StoreOf<SpaceNewsListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            if !viewStore.state.isLoaderActive {
                List {
                    ForEachStore(
                        store.scope(
                            state: \.items,
                            action: SpaceNewsListAction.item
                        ),
                        content: SpaceNewsListItemView.init
                    )
                    .navigationBarTitleDisplayMode(.inline)
                }
                .background(
                    NavigationLink(
                        isActive: viewStore.binding(
                            get: \.isNewsPageActive,
                            send: SpaceNewsListAction.setNewsPageActive
                        ),
                        destination: {
                            IfLetStore(
                                store.scope(
                                    state: \.newsPage,
                                    action: SpaceNewsListAction.newsPage
                                ),
                                then: SpaceNewsPageView.init
                            )
                        },
                        label: { EmptyView() }
                    )
                )
            }else  {
                ProgressView()
                    .onAppear {
                        viewStore.send(.onAppear)
                    }
            }
            
        }
        
    }
}

// MARK: - Preview

struct SpaceNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceNewsListView(
            store: Store(
                initialState: SpaceNewsListState(transitionType: .deferred),
                reducer: SpaceNewsListReducer(
                    articlesService: ArticleServiceImplementation(
                        transport: HTTPTransport()
                    )
                )
            )
        )
    }
}

