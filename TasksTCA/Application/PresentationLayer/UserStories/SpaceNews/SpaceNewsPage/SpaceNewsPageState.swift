//
//  SpaceNewsPageState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation

// MARK: - SpaceNewsPageState

public struct SpaceNewsPageState: Equatable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public var id: Int
    
    /// The title of the article
    public var title: String
    
    /// The URL of the article's image
    public var imageURL: URL?
    
    /// A summary  of the article content
    public var summary: String
    
    /// The news site name where the article is published
    public var newsSite: String
    
    /// If article is added to favourite
    public var isArticleAddedToFavourite = false
    
    /// If loader is active
    public var isLoaderActive: Bool
    
    // MARK: - Initializers
    
    public init(id: Int) {
        self.id = id
        self.title = ""
        self.imageURL = nil
        self.summary = ""
        self.newsSite = ""
        self.isLoaderActive = true
    }
    
    public init(article: ArticlePlainObject) {
        self.id = article.id
        self.title = article.title
        self.imageURL = article.imageURL
        self.summary = article.summary
        self.newsSite = article.newsSite
        self.isLoaderActive = false
    }
}

// MARK: - Text

extension SpaceNewsPageState {
    
    /// News site that published the article text
    public var publisherNewsSiteText: String {
        "Published by \(newsSite)"
    }
}
