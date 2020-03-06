//
//  AIUIKit+String.swift
//  AIUIKit
//
//  Copyright © 2020 Adrian Ilie. All rights reserved.
//

import UIKit

public extension String {
    /**
     * Remove HTML tags from string.
     *
     * - returns: filtered string
     */
    func htmlTagsFiltered() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    /**
     * Trim string to specified length.
     *
     * - parameter length: desired string length
     * - returns: trimmed string
     */
    func trimToLength(length: Int) -> String {
        if let range = Range(NSRange(location: 0, length: min(self.count, length)), in: self) {
            let trimRange = self.rangeOfComposedCharacterSequences(for: range)
            return self[trimRange].trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        return self
    }

    /**
     * Return the visible porition of a string that can be rendered in a CGRect.
     *
     * - parameter size: size of rect
     * - parameter font: font used for rendering string
     * - returns: visible part of the string
     */
    func visible(inSize size: CGSize, withFont font: UIFont) -> String {
        var visibleString = ""
        for index in self.indices[self.startIndex ..< self.endIndex] {
            let testString = String(self[..<index])
            let stringSize = NSString(string: testString).boundingRect(
                with: CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude),
                options: .usesLineFragmentOrigin,
                attributes: [NSAttributedString.Key.font : font],
                context: nil
            )
            
            if stringSize.size.height > size.height || stringSize.size.width > size.width {
                break
            }
            
            visibleString = testString
        }
        
        return visibleString.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /**
     * Calculate the necessary height for a string to be rendered.
     *
     * - parameter font: font used
     * - parameter width: horizontal limit
     * - returns: required height
     */
    func requiredHeightToDisplay(forWidth width: CGFloat, withFont font: UIFont) -> CGFloat {
        return ceil(NSString(string: self).boundingRect(
            with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font : font],
            context: nil
        ).size.height)
    }
}
