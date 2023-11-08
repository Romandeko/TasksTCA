//
//  SpaceNewsListAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation

// MARK: - SpaceNewsListAction

public enum SpaceNewsListAction: Equatable {
    
    // MARK: - Cases
    
    /// On appear action
    case onAppear
    
    // MARK: - Children
    
    /// Actions of child module `SpaceNewsPageAction`
    case newsPage(SpaceNewsPageAction)
    
    /// Item action
    case item(id: SpaceNewsListItemState.ID, action: SpaceNewsListItemAction)
    
    // MARK: - Navigation
    
    /// Setter for `isNewsPageActive` property binding
    case setNewsPageActive(Bool)
    
    // MARK: - Services
    
    /// Action for `ArticlesService` business logic
    case articlesService(Result<ArticleServiceAction, ArticleServiceError>)
}
