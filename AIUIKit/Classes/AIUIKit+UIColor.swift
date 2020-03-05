//
//  AIUIKIT+UIColor.swift
//  AIUIKit
//
//  Copyright © 2020 Adrian Ilie. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     * Initializes a color using the specified hex and opacity value.
     *
     * - parameter hex: hexadecimal color value
     * - parameter alpha: opacity value
     * - return: color object
     */
    convenience init(hex: String, alpha: CGFloat? = 1.0) {
        var hexInt: UInt32 = 0
        let scanner = Scanner(string: hex)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     * Returns red, green, blue and alpha values.
     */
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
