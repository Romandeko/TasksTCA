//
//  WebService.swift
//  TasksTCA
//
//  Created by Роман Денисенко on 8.11.23.
//

import Foundation
import ServiceCore
import HTTPTransport

// MARK: - WebService

extension WebService {
    
   public func serviceCall<T: Decodable>(from request: HTTPRequest) -> ServiceCall<T> {
        createCall {
            let result =  self.transport.send(request: request)
            switch result {
            case .success(let response):
                let data = response.body.unsafelyUnwrapped
                let result = try data.decoded() as T
                return .success(result)
            case .failure(error: let error):
                return .failure(error)
            }
        }
    }
    
    public func serviceCall<T: Decodable>(from request: HTTPRequest, dataByKey: String) -> ServiceCall<T> {
        createCall {
            let result =  self.transport.send(request: request)
            switch result {
            case .success(let response):
                let resultJson = try response.getJSONDictionary()?[dataByKey]
                let resultData = try JSONSerialization.data(withJSONObject: resultJson as Any)
                let result = try resultData.decoded() as T
                return .success(result)
            case .failure(error: let error):
                return .failure(error)
            }
        }
    }
}


