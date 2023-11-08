//
//  ArticleService.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ServiceCore

// MARK: - ArticleServiceAction

public enum ArticleServiceAction: Equatable {
    
    // MARK: - Cases
    
    case articlesObtained([ArticlePlainObject])
    
    case articleWithIdObtained(ArticlePlainObject)
}

// MARK: - ArticleServiceError

public typealias ArticleServiceError = NSError

// MARK: - ArticlesService

public protocol ArticleService {
    
    /// Obtain all articles
    /// - Parameters:
    ///   - limit: number of articles
    /// - Returns: all articles
    func obtainArticles(limit: Int) -> ServiceCall<[ArticlePlainObject]>
    
    /// Obtain article by Id
    /// - Parameter id: id of article
    /// - Returns: article by id
    func obtainArticle(withId id: Int) -> ServiceCall<ArticlePlainObject>
}
