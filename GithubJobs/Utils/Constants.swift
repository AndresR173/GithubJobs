//
//  Constants.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Foundation
import SwiftUI

struct Constants {
    struct Api {
        static let host = "jobs.github.com"
        static let scheme = "https"

        static func getBaseURLComponents() -> URLComponents {
            var components = URLComponents()
            components.scheme = Constants.Api.scheme
            components.host = Constants.Api.host

            return components
        }
    }
}
