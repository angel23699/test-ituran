//
//  WheatherResponse.swift
//  testRest
//
//  Created by Angel Arce on 04/04/23.
//

import Foundation

struct WheatherResponse: Codable {
    var results: [ResultsResponse]
}

struct ResultsResponse: Codable {
    var stations: [StationsResponse]
}

struct StationsResponse: Codable {
    var measurements: [Measurements]
}

struct Measurements: Codable {
    var value: String
}
