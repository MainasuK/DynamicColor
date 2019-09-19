//
//  RootViewController.swift
//  DynamicColor
//
//  Created by Cirno MainasuK on 2019-9-16.
//  Copyright © 2019 MainasuK. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    let nestTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()

        nestTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(nestTabBarController)
        view.addSubview(nestTabBarController.view)
        NSLayoutConstraint.activate([
            nestTabBarController.view.topAnchor.constraint(equalTo: view.topAnchor),
            nestTabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nestTabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nestTabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        nestTabBarController.didMove(toParent: self)

        nestTabBarController.viewControllers = [SystemColorsViewController()]
            .map { UINavigationController(rootViewController: $0) }
    }

}
