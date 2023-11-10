//
//  SpaceNewsPageReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ComposableArchitecture

// MARK: - SpaceNewsPageReducer

public struct SpaceNewsPageReducer: Reducer {
    
    // MARK: - Properties
    
    /// ArticleService instance
    private let articlesService: ArticleService
    
    // MARK: - Initializers
    
    public init(articlesService: ArticleService) {
        self.articlesService = articlesService
    }
    
    // MARK: - Reducer
    
    public var body: some Reducer<SpaceNewsPageState, SpaceNewsPageAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                switch state.pageType {
                case .withRequest:
                    return .send(.obtainArticle)
                case .withoutRequest:
                    return .none
                }
            case .obtainArticle:
                return articlesService
                    .obtainArticle(withId: state.id)
                    .publish()
                    .map(ArticleServiceAction.articleWithIdObtained)
                    .catchToEffect(SpaceNewsPageAction.articlesService)
            case .articlesService(.success(.articleWithIdObtained(let article))):
                state.title = article.title
                state.newsSite = article.newsSite
                state.summary = article.summary
                state.imageURL = article.imageURL
                state.isLoaderActive = false
            case .articlesService(.failure(_)):
                state.alert = AlertState(
                    title: TextState("Error"),
                    message: TextState("Try again?"),
                    buttons: [
                        .cancel(.init("No"),action: .send(.noButtonTapped)),
                        .default(.init("Yes"), action: .send(.obtainArticle))
                    ]
                )
            case .addToFavourite:
                state.isArticleAddedToFavourite.toggle()
            default:
                break
            }
            return .none
            
        }
    }
}
