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
    func searchJobs(for position: String, in location: String?)
}

final class JobsViewModel: ObservableObject {

}
