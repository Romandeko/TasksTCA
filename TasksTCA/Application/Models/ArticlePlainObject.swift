//
//  ArticlePlainObject.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation

// MARK: - ArticlePlainObject

public struct ArticlePlainObject: Decodable, Equatable {
    
    // MARK: - Properties
    
    /// The unique identifier of the article.
    public let id: Int
    
    /// The title of the article.
    public let title: String
  
    /// The URL of the article's image.
    public let imageURL: URL
    
    /// The news site name where the article is published.
    public let newsSite: String
    
    /// A summary  of the article content.
    public let summary: String
    
    /// The date and time when the article was published.
    public let publishedAt: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURL = "image_url"
        case newsSite = "news_site"
        case summary
        case publishedAt = "published_at"
    }
}
