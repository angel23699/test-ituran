//
//  ResponseFilter.swift
//  testRest
//
//  Created by Angel Arce on 04/04/23.
//

import Foundation

class ResponseFilter {
    
    static func filter(response: WheatherResponse) -> [String] {
        var values = [String]()
        
        for item in response.results {
            if item.stations.count > 0, let station = item.stations.first {
                for ms in station.measurements {
                    values.append(ms.value)
                }
            }
        }
        
        return values
    }
}
