//
//  ViewController.swift
//  DynamicColor
//
//  Created by Cirno MainasuK on 2019-9-16.
//  Copyright © 2019 MainasuK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.textColor = ._label
        return label
    }()

}

extension ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "GreatColor")

        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}

