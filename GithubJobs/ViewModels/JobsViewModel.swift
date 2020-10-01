//
//  JobsViewModelProtocol.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Foundation
import Combine

protocol JobsViewModelProtocol {
    var jobs: [Job] { get }
    func searchJobsFor(_ position: String, in location: String?)
}

final class JobsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var jobs = [Job]()
    let service: JobsServiceProtocol

    // MARK: - Initializer

    init(_ service: JobsServiceProtocol) {
        self.service = service
    }
}

// MARK: - Protocol Implementation [JobsVieModelProtocol]

extension JobsViewModel: JobsViewModelProtocol {
    func searchJobsFor(_ position: String, in location: String? = nil) {

    }
}
