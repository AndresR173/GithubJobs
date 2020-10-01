//
//  JobsService.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Foundation
import Combine

protocol JobsServiceProtocol {
    func searchJobsFor(_ position: String, in location: String) -> Result<[Job], Error>
}
