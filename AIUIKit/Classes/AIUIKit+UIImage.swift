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
    class func ofView(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }

    /**
     * Create transparent image.
     *
     * - parameter size: image size
     * - returns: transparent image
     */
    class func transparent(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        return image
    }

    /**
     * Create a transparent UIImage with the contents of an UILabel.
     *
     * - parameter label: label to draw
     * - return: image object
     */
    class func image(withLabel label: UILabel) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 0.0)
        
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    /**
     * Create a transparent UIImage with a string placed centrally.
     *
     * - parameter fontName: text font name
     * - parameter content: text value
     * - parameter color: text color
     * - parameter size: image size
     * - return: image object
     */
    class func image(withFontName fontName: String, content: String, color: UIColor, size: CGSize) -> UIImage {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        label.text = content
        label.font = UIFont.init(name: fontName, size: min(size.width, size.height) * 0.85)
        label.textAlignment = .center
        label.textColor = color
        
        let image = UIImage.image(withLabel: label)
        return image
    }
    
    /**
     * Create a transparent square UIImage with a string placed centrally.
     *
     * - parameter fontName: text font name
     * - parameter content: text value
     * - parameter color: text color
     * - parameter size: image height and width
     * - return: iamge object
     */
    class func image(withFontName fontName: String, content: String, color: UIColor, size: CGFloat) -> UIImage {
        return UIImage.image(withFontName: fontName, content: content, color: color, size: CGSize.init(width: size, height: size))
    }
}
