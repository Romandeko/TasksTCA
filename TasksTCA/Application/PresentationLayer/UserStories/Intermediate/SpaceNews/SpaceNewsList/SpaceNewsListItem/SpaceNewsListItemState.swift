//
//  SpaceNewsListItemState.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ComposableArchitecture

// MARK: - SpaceNewsListItemState

public struct SpaceNewsListItemState: Identifiable, Equatable {
    
    // MARK: - Properties

    /// Unique identifier
    public let id: Int
    
    /// The title of the article.
    public let title: String

    /// The URL of the article's image.
    public let imageURL: URL
    
    /// The news site name where the article is published.
    public let newsSite: String
    
    /// If loader is active
    public var isLoaderActive = false
    
    // MARK: - Initializers
    
    public init(articlePlain: ArticlePlainObject) {
        self.id = articlePlain.id
        self.title = articlePlain.title
        self.imageURL = articlePlain.imageURL
        self.newsSite = articlePlain.newsSite
    }
}
