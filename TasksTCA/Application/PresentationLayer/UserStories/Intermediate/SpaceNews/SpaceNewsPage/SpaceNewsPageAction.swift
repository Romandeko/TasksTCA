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
    
    /// Dismiss the alert
    case dismissButtonTapped
    
    /// Dismisses the view
    case noButtonTapped
    
    /// Make obtain article with id reques
    case obtainArticle
    
    // MARK: - Services
    
    /// Action for `ArticlesService` business logic
    case articlesService(Result<ArticleServiceAction, ArticleServiceError>)
}
