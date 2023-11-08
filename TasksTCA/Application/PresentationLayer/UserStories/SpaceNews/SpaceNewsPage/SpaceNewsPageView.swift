//
//  SpaceNewsPageView.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import Kingfisher
import HTTPTransport

// MARK: - SpaceNewsPageView

public struct SpaceNewsPageView: View {
    
    // MARK: - Properties
    
    /// The store powering the `SapaceNewsPage` Reducer
    public let store: StoreOf<SpaceNewsPageReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            if !viewStore.state.isLoaderActive {
                ScrollView {
                    VStack(spacing: 10) {
                        KFImage(viewStore.imageURL)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        Text(viewStore.title)
                            .font(.system(size: 22, weight: .bold))
                        HStack(spacing: 3) {
                            Text(viewStore.publisherNewsSiteText)
                                .font(.system(size: 19, weight: .semibold))
                            Spacer()
                            Button {
                                viewStore.send(.addToFavourite)
                            } label : {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(viewStore.isArticleAddedToFavourite ? .red : .black)
                            }
                        }
                        Text(viewStore.summary)
                            .font(.system(size: 17))
                    }
                    .padding(.horizontal, 10)
                }
            } else {
                ProgressView()
                    .onAppear {
                        viewStore.send(.onAppear)
                    }
            }
        }
    }
}

// MARK: - Preview

struct SpaceNewsPageView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceNewsPageView(
            store: Store(
                initialState: SpaceNewsPageState(id: 21400),
                reducer: SpaceNewsPageReducer(
                    articlesService: ArticleServiceImplementation(
                        transport: HTTPTransport()
                    )
                )
            )
        )
    }
}


