//
//  AIUIKit+UIImage.swift
//  AIUIKit
//
//  Copyright © 2020 Adrian Ilie. All rights reserved.
//

import UIKit

public extension UIImage {
    /**
     * Create a image filled with a color.
     *
     * - parameter color: image color
     * - parameter size: image size
     * - returns: colored image
     */
    convenience init?(size: CGSize, color: UIColor) {
        let bounds = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(bounds.size)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(bounds)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = image.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
    
    /**
     * Create image from a view.
     *
     * - parameter view: source view
     * - returns: image of source view
     */
    convenience init?(ofView view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = image.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

    /**
     * Create transparent image.
     *
     * - parameter size: image size
     * - returns: transparent image
     */
    convenience init?(size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = image.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }

    /**
     * Create a transparent UIImage with the contents of an UILabel.
     *
     * - parameter label: label to draw
     * - return: image object
     */
    convenience init?(label: UILabel) {
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        label.layer.render(in: context)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext(), let cgImage = image.cgImage else {
            return nil
        }
        self.init(cgImage: cgImage)
    }
    
    /**
     * Create a transparent UIImage with a string placed centrally.
     *
     * - parameter size: image size
     * - parameter font: text font
     * - parameter color: text color
     * - parameter content: text value
     *
     * - return: image object
     */
    convenience init?(size: CGSize, font: UIFont, color: UIColor, content: String) {
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        label.numberOfLines = 0
        label.text = content
        label.font = font
        label.textAlignment = .center
        label.textColor = color
        
        guard let cgImage = UIImage(label: label)?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
