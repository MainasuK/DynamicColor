//
//  UIColor.swift
//  DynamicColor
//
//  Created by Cirno MainasuK on 2019-9-16.
//  Copyright © 2019 MainasuK. All rights reserved.
//

import UIKit

extension UIColor {

    static let _label: UIColor = {
        let _label = UIColor.black

        if #available(iOS 13, *) {
            return UIColor { trait -> UIColor in
                switch trait.userInterfaceStyle {
                case .dark:     return .label
                default:        return _label
                }
            }
        } else {
            return _label
        }
    }()

    static let _secondaryLabel: UIColor = {
        let _secondaryLabel = UIColor(displayP3Red: 60.0/255.0, green: 60.0/255.0, blue: 67.0/255.0, alpha: 0.6)

        if #available(iOS 13, *) {
            return UIColor { trait -> UIColor in
                switch trait.userInterfaceStyle {
                case .dark:     return .secondaryLabel
                default:        return _secondaryLabel
                }
            }
        } else {
            return _secondaryLabel
        }
    }()

    static let _tertiaryLabel: UIColor = {
        let _tertiaryLabel = UIColor(displayP3Red: 60.0/255.0, green: 60.0/255.0, blue: 67.0/255.0, alpha: 0.3)

        if #available(iOS 13, *) {
            return UIColor { trait -> UIColor in
                switch trait.userInterfaceStyle {
                case .dark:     return .tertiaryLabel
                default:        return _tertiaryLabel
                }
            }
        } else {
            return _tertiaryLabel
        }
    }()

}

extension UIColor {

    static let _systemBackground: UIColor = {
       let _systemBackground = UIColor.white

       if #available(iOS 13, *) {
           return UIColor { trait -> UIColor in
               switch trait.userInterfaceStyle {
               case .dark:     return .systemBackground
               default:        return _systemBackground
               }
           }
       } else {
           return _systemBackground
       }
   }()

   static let _secondarySystemBackground: UIColor = {
       let _secondarySystemBackground = UIColor(displayP3Red: 239.0/255.0, green: 239.0/255.0, blue: 244.0/255.0, alpha: 1.0)

       if #available(iOS 13, *) {
           return UIColor { trait -> UIColor in
               switch trait.userInterfaceStyle {
               case .dark:     return .secondarySystemBackground
               default:        return _secondarySystemBackground
               }
           }
       } else {
           return _secondarySystemBackground
       }
   }()

}
