//
//  SceneDelegate.swift
//  DynamicColor
//
//  Created by Cirno MainasuK on 2019-9-16.
//  Copyright © 2019 MainasuK. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let _window = UIWindow(windowScene: windowScene)
        window = _window

        _window.rootViewController = RootViewController()
        _window.makeKeyAndVisible()
    }

}

