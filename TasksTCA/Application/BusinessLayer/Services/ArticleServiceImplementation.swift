//
//  ArticleServiceImplementation.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ServiceCore
import HTTPTransport
import Codex

// MARK: - ArticlesServiceImplementation

public final class ArticleServiceImplementation: WebService {
    
    // MARK: - Initializers
    
    public init(
        transport: HTTPTransport
    ) {
        super.init(
            baseURL: Constants.NetWork.apiURL,
            transport: transport
        )
    }
}

// MARK: - ArticlesService

extension ArticleServiceImplementation: ArticleService {
    
    public func obtainArticles(limit: Int) -> ServiceCall<[ArticlePlainObject]> {
        let queryArguments = self.fillHTTPRequestParameters(
            self.urlParameters,
            with: [
                "limit": limit,
            ]
        )
        let request = HTTPRequest(
            httpMethod: .get,
            endpoint: "/articles",
            parameters: [queryArguments],
            base: self.baseRequest
        )
        return serviceCall(from: request, dataByKey: "results")
    }
    
    public func obtainArticle(withId id: Int) -> ServiceCall<ArticlePlainObject> {
        let request = HTTPRequest(
            httpMethod: .get,
            endpoint: "/articles/\(id)/",
            base: self.baseRequest
        )
        return serviceCall(from: request)
    }
}

