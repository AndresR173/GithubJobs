//
//  ServiceProvider.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Combine
import Foundation

struct ServiceProvider {
    func run(_ path: String, queryItems: [URLQueryItem]) -> AnyPublisher<Data, Error> {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.Api.scheme
        urlComponents.host = Constants.Api.host
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            return Fail(error: NetworkErrors.badRequest).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { $0.data }
            .mapError { NetworkErrors.badContent(error: $0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum NetworkErrors: Error {
    case badRequest
    case badContent(error: Error)
}
