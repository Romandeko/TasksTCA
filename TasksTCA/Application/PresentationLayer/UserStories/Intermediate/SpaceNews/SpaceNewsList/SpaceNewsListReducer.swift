//
//  SpaceNewsListReducer.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ComposableArchitecture
import HTTPTransport

// MARK: - SpaceNewsListReducer

public struct SpaceNewsListReducer: Reducer {
    
    // MARK: - Properties
    
    /// ArticleService instance
    private let articlesService: ArticleService
    
    // MARK: - Initializers
    
    public init(articlesService: ArticleService) {
        self.articlesService = articlesService
    }
    
    // MARK: - Reducer
    
    public var body: some Reducer<SpaceNewsListState, SpaceNewsListAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return articlesService
                    .obtainArticles(limit: Constants.NetWork.articlesLimit)
                    .publish()
                    .map(ArticleServiceAction.articlesObtained)
                    .catchToEffect(SpaceNewsListAction.articlesService)
            case .articlesService(.success(.articlesObtained(let articles))):
                state.items = IdentifiedArray(uniqueElements: articles.map(SpaceNewsListItemState.init))
                state.isLoaderActive = false
            case .item(let id, action: .itemTapped):
                switch state.transitionType {
                case .deferred:
                    state.items[id: id]?.isLoaderActive = true
                    return articlesService
                        .obtainArticle(withId: id)
                        .publish()
                        .map(ArticleServiceAction.articleWithIdObtained)
                        .catchToEffect(SpaceNewsListAction.articlesService)
                case .instant:
                    state.newsPage = SpaceNewsPageState(id: id)
                    return .send(.setNewsPageActive(true))
                }
            case .articlesService(.success(.articleWithIdObtained(let article))):
            state.newsPage = SpaceNewsPageState(article: article)
            state.items[id: article.id]?.isLoaderActive = false
               return .send(.setNewsPageActive(true))
            case .setNewsPageActive(let value):
                state.isNewsPageActive = value
            default:
                break
            }
            return .none
        }
        .forEach(\.items, action: /SpaceNewsListAction.item) {
            SpaceNewsListItemReducer()
        }
        .ifLet(\.newsPage, action: /SpaceNewsListAction.newsPage) {
            SpaceNewsPageReducer(articlesService: articlesService)
        }
    }
}
