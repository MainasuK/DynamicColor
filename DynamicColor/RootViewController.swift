//
//  RootViewController.swift
//  DynamicColor
//
//  Created by Cirno MainasuK on 2019-9-16.
//  Copyright © 2019 MainasuK. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lightModeViewController = ViewController()
        let darkModeViewController = ViewController()
        if #available(iOS 13.0, *) {
            lightModeViewController.overrideUserInterfaceStyle = .light
            darkModeViewController.overrideUserInterfaceStyle = .dark
            lightModeViewController.label.text = "Light Mode"
            darkModeViewController.label.text = "Dark Mode"
        } else {
            lightModeViewController.label.text = "Light Mode"
            darkModeViewController.label.text = "Light Mode"
        }

        lightModeViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(lightModeViewController)
        view.addSubview(lightModeViewController.view)
        NSLayoutConstraint.activate([
            lightModeViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            lightModeViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightModeViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lightModeViewController.view.bottomAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        lightModeViewController.didMove(toParent: self)

        darkModeViewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(darkModeViewController)
        view.addSubview(darkModeViewController.view)
        NSLayoutConstraint.activate([
            darkModeViewController.view.topAnchor.constraint(equalTo: view.centerYAnchor),
            darkModeViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkModeViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            darkModeViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        darkModeViewController.didMove(toParent: self)
    }

}
