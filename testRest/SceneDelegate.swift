//
//  SceneDelegate.swift
//  testRest
//
//  Created by Angel Arce on 04/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowsScene)
        WeatherRouter.showWeatherValues(window: window)
    }
}

