//
//  AIUIKit+UIImage.swift
//  AIUIKit
//
//  Copyright © 2020 Adrian Ilie. All rights reserved.
//

import UIKit

public extension UIImage {
    /**
     * Create transparent image.
     *
     * - parameter size: image size
     * - returns: transparent image
     */
    convenience init?(size: CGSize) {
        var image: UIImage?
        if #available(iOS 11.0, *) {
            let renderer = UIGraphicsImageRenderer(size: size)
            image = renderer.image { (context) in
                
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            defer { UIGraphicsEndImageContext() }
            
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        guard let outputImage = image, let cgImage = outputImage.cgImage else { return nil}
        self.init(cgImage: cgImage, scale: outputImage.scale, orientation: outputImage.imageOrientation)
    }
    
    /**
     * Create a image filled with a color.
     *
     * - parameter color: image color
     * - parameter size: image size
     * - returns: colored image
     */
    convenience init?(size: CGSize, color: UIColor) {
        let bounds = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        
        var image: UIImage?
        if #available(iOS 11.0, *) {
            let renderer = UIGraphicsImageRenderer(size: size)
            image = renderer.image { (context) in
                color.setFill()
                context.fill(bounds)
            }
        } else {
            UIGraphicsBeginImageContext(bounds.size)
            defer { UIGraphicsEndImageContext() }
        
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(color.cgColor)
            context?.fill(bounds)
            
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        guard let outputImage = image, let cgImage = outputImage.cgImage else { return nil}
        self.init(cgImage: cgImage, scale: outputImage.scale, orientation: outputImage.imageOrientation)
    }
    
    /**
     * Create UIImage with the contents of a view.
     *
     * - parameter view: source view
     * - returns: image of source view
     */
    convenience init?(ofView view: UIView) {
        var image: UIImage?
        if #available(iOS 11.0, *) {
            let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
            image = renderer.image { (context) in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
            defer { UIGraphicsEndImageContext() }
        
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        guard let outputImage = image, let cgImage = outputImage.cgImage else { return nil}
        self.init(cgImage: cgImage, scale: outputImage.scale, orientation: outputImage.imageOrientation)
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
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attrString = NSAttributedString(string: content, attributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        
        var image: UIImage?
        if #available(iOS 11.0, *) {
            let renderer = UIGraphicsImageRenderer(size: size)
            image = renderer.image { (context) in
                attrString.draw(
                    with: CGRect(x: 0.0, y: (size.height - font.pointSize) * 0.5, width: size.width, height: size.height),
                    options: [.usesLineFragmentOrigin],
                    context: nil
                )
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            defer { UIGraphicsEndImageContext() }
            
            attrString.draw(
                with: CGRect(x: 0.0, y: (size.height - font.pointSize) * 0.5, width: size.width, height: size.height),
                options: [.usesLineFragmentOrigin],
                context: nil
            )
            
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        
        guard let outputImage = image, let cgImage = outputImage.cgImage else { return nil}
        self.init(cgImage: cgImage, scale: outputImage.scale, orientation: outputImage.imageOrientation)
    }
}
