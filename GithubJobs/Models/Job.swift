//
//  Job.swift
//  GithubJobs
//
//  Created by Andres Felipe Rojas R. on 1/10/20.
//

import Foundation

struct Job: Codable, Identifiable {
    let id: String
    let type: String
    let url: String
    let createdAt: String
    let company: String?
    let companyUrl: String?
    let location: String
    let title: String
    let description: String
    let howToApply: String
    let companyLogo: String?

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case url
        case createdAt = "created_at"
        case company
        case companyUrl = "company_url"
        case location
        case title
        case description
        case howToApply = "how_to_apply"
        case companyLogo = "company_logo"
    }
}
