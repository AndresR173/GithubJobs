//
//  JobsService.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Foundation
import Combine

protocol JobsServiceProtocol {
    func searchJobsFor(_ position: String, in location: String) -> AnyPublisher<[Job], Error>
}

final class JobsService {
    let provider = ServiceProvider()
}

//MARK: - Protocol Implementation [JobsServiceProtol]
extension JobsService: JobsServiceProtocol {
    func searchJobsFor(_ position: String, in location: String) -> AnyPublisher<[Job], Error> {
        return Fail(error: NetworkErrors.badRequest).eraseToAnyPublisher()
    }
}
