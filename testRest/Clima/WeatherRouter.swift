//
//  WeatherRouter.swift
//  testRest
//
//  Created by Angel Arce on 04/04/23.
//

import Foundation
import UIKit

class WeatherRouter {
    
    static func showWeatherValues(window: UIWindow?) {
        //let interactor = WeatherInteractorMock() // mock
        let interactor = WeatherInteractor() // API REST
        
        let presenter = WeatherPresenter(interactor: interactor)
        
        let view = WeatherView(presenter: presenter)
        
        presenter.ui = view
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
