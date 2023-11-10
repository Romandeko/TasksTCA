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
                return .send(.obtainArticles)
            case .obtainArticles:
                if Bool.random() {
                    return articlesService
                        .obtainArticles(limit: Constants.NetWork.articlesLimit)
                        .publish()
                        .map(ArticleServiceAction.articlesObtained)
                        .catchToEffect(SpaceNewsListAction.articlesService)
                }
                return .send(.articlesService(.failure(ArticleServiceError())))
            case .articlesService(.success(.articlesObtained(let articles))):
                state.items = IdentifiedArray(uniqueElements: articles.map(SpaceNewsListItemState.init))
                state.isLoaderActive = false
                state.alert = nil
            case .articlesService(.failure(_)):
                if let tappedItemId = state.tappedItemID {
                    state.items[id: tappedItemId]?.isLoaderActive = false
                    state.alert = AlertState(
                        title: TextState("Error"),
                        message: TextState("Try again?"),
                        buttons: [
                            .cancel(.init("No"),action: .send(.dismissAlert)),
                            .default(
                                .init("Yes"),
                                action: .send(
                                    .item(
                                        id: tappedItemId,
                                        action: .itemTapped
                                    )
                                )
                            )
                        ]
                    )
                } else {
                    state.alert = AlertState(
                        title: TextState("Error"),
                        message: TextState("Try again?"),
                        buttons: [
                            .cancel(.init("No"),action: .send(.noButtonTapped)),
                            .default(.init("Yes"), action: .send(.obtainArticles))
                        ]
                    )
                }
            case .item(let id, action: .itemTapped):
                switch state.transitionType {
                case .deferred:
                    state.tappedItemID = id
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
                state.tappedItemID = nil
                state.alert = nil
                state.newsPage = SpaceNewsPageState(article: article)
                state.items[id: article.id]?.isLoaderActive = false
                return .send(.setNewsPageActive(true))
            case .setNewsPageActive(let value):
                state.isNewsPageActive = value
            case .newsPage(.noButtonTapped):
                return .send(.setNewsPageActive(false))
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
        ._printChanges()
    }
}
