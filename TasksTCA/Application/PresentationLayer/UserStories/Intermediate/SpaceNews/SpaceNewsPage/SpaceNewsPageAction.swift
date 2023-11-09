//
//  SpaceNewsPageAction.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation

// MARK: - SpaceNewsPageAction

public enum SpaceNewsPageAction: Equatable {
    
    // MARK: - Cases
    
    /// On appear action
    case onAppear
    
    /// Setter for `isArticleAddedToFavourite` property binding
    case addToFavourite
    
    // MARK: - Services
    
    /// Action for `ArticlesService` business logic
    case articlesService(Result<ArticleServiceAction, ArticleServiceError>)
}
