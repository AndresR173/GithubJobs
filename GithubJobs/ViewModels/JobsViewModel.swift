//
//  JobsViewModelProtocol.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Foundation
import Combine
import SwiftUI

enum SearchStatus {
    case initial, loading, loaded, empty
}

protocol JobsViewModelProtocol: ObservableObject {
    var jobs: [Job] { get }
    var status: SearchStatus { get }
    func searchJobsFor(_ position: String, in location: String?)
}

final class JobsViewModel {

    // MARK: - Properties

    @Published var jobs = [Job]()
    @Published var status: SearchStatus = .initial
    
    let service: JobsServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initializer

    init(service: JobsServiceProtocol) {
        self.service = service
    }
}

// MARK: - Protocol Implementation [JobsVieModelProtocol]

extension JobsViewModel: JobsViewModelProtocol {
    func searchJobsFor(_ position: String, in location: String? = nil) {
        status = .loading
        service.searchJobsFor(position: position, in: location)
            .mapError { [weak self] error -> Error in
                self?.status = .empty
                return error
            }
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] jobs in
                    self?.jobs = jobs
                    self?.status = jobs.isEmpty ? .empty : .loaded
                  }
            ).store(in: &cancellables)
    }
}

extension JobsViewModelProtocol {
    func searchJobsFor( _ position: String, in location: String? = nil) {
        return searchJobsFor(position, in: location)
    }
}
