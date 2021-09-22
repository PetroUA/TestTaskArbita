//
//  LocationApiResponses.swift
//  TestTaskArbita
//
//  Created by Petro on 21.09.2021.
//

import Foundation

struct LocationResponse: Codable{
    let ip: String
    let hostname: String
    let city: String
    let region: String
    let country: String
    let loc: String
    let org: String
    let postal: String
    let timezone: String
}
