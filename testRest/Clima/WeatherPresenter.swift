//
//  WeatherPresenter.swift
//  testRest
//
//  Created by Angel Arce on 04/04/23.
//

import Foundation

protocol WeatherUI: AnyObject {
    func updatelistValues()
    func showError(msg: String)
}

class WeatherPresenter {
    
    private var interactor: WeatherInteratable
    
    var dataset = [String]()
    
    weak var ui: WeatherUI?
    
    init(interactor: WeatherInteratable) {
        self.interactor = interactor
    }
    
    func onViewAppear() {
        Task {
            do {
                let model = try await interactor.makeResponse()
                dataset = ResponseFilter.filter(response: model)
                
                print(dataset)
                
                ui?.updatelistValues()
            } catch let err as BackendError {
                ui?.showError(msg: err.rawValue)
            }
        }
    }
}
