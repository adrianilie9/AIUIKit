//
//  AIUIKit+UIFont.swift
//  AIUIKit
//
//  Copyright © 2020 Adrian Ilie. All rights reserved.
//

import UIKit

public extension UIFont {
    /**
     * Print to console a list of fonts available in the application.
     */
    static func printAvailableFonts() {
        for fontFamily in UIFont.familyNames {
            print("\(fontFamily): \(UIFont.fontNames(forFamilyName: fontFamily))")
        }
    }
}
