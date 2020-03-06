//
//  AIUIKit+CGSize.swift
//  AIUIKit
//
//  Copyright © 2020 Adrian Ilie. All rights reserved.
//

import UIKit

extension CGSize {
    /**
     * Resize a given CGSize to fit in a maximum CGSize, while maintaining the aspect ratio.
     *
     * - parameter size: maximum size
     * - returns: resized CGSize
     */
    public func resize(toMaximumSize size: CGSize) -> CGSize {
        var resizeWidth: CGFloat = 0.0
        var resizeHeight: CGFloat = 0.0
        
        if (self.width / self.height) > (size.width / size.height) {
            resizeWidth = size.width
            resizeHeight = (size.width * self.height) / self.width
        } else if (self.width / self.height) < (size.width / size.height) {
            resizeWidth = (size.height * self.width) / self.height
            resizeHeight = size.height
        } else {
            resizeWidth = size.width
            resizeHeight = size.height
        }
        
        return CGSize(width: ceil(resizeWidth), height: ceil(resizeHeight))
    }
}
