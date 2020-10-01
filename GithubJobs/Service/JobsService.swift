//
//  JobsService.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Foundation
import Combine

protocol JobsServiceProtocol {
    func searchJobsFor(position: String, in location: String?) -> AnyPublisher<[Job], Error>
}

final class JobsService {
    private let apiClient = APIClient()

    private func requestJobSearch(position: String, location: String?) -> AnyPublisher<[Job], Error> {
        var urlComponents = Constants.Api.getBaseURLComponents()
        urlComponents.path = "positions.json"
        var queryItems = [URLQueryItem(name: "description", value: "position")]
        if let location = location {
            queryItems.append(URLQueryItem(name: "location", value: location))
        }
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            return Fail(error: NetworkError.badRequest).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

//MARK: - Protocol Implementation [JobsServiceProtol]
extension JobsService: JobsServiceProtocol {
    func searchJobsFor(position: String, in location: String? = nil) -> AnyPublisher<[Job], Error> {
        return requestJobSearch(position: position, location: location)
    }
}
