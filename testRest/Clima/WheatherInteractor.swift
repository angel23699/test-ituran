//
//  WheatherInteractor.swift
//  testRest
//
//  Created by Angel Arce on 04/04/23.
//

import Foundation

protocol WeatherInteratable {
    func makeResponse() async throws -> WheatherResponse
}

enum BackendError: String, Error {
    case ErrorParse = "Lo sentimos, ocurrió un error, intente de nuevo."
}

class WeatherInteractor : WeatherInteratable {
    
    func makeResponse() async throws -> WheatherResponse {
        let url = Constants.URL_CALIDAD_AIRE
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            let response = try JSONDecoder().decode(WheatherResponse.self, from: data)
            
            return response
        } catch {
            throw BackendError.ErrorParse
        }
    }
}


// MOCK
class WeatherInteractorMock : WeatherInteratable {
    
    func makeResponse() async throws -> WheatherResponse {
        return WheatherResponse(results: [
            ResultsResponse(stations: [StationsResponse(measurements: [Measurements(value: "1")])]),
            ResultsResponse(stations: [StationsResponse(measurements: [Measurements(value: "22")])]),
            ResultsResponse(stations: [StationsResponse(measurements: [Measurements(value: "333")])])
        ])
    }
}
