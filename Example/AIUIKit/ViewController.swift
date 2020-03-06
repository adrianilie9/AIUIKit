//
//  ViewController.swift
//  AIUIKit
//
//  Copyright (c) 2020 Adrian Ilie. All rights reserved.
//

import UIKit
import AIUIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupScrollView()
        
        demoColorHex()
        demoString()
        demoImage()
    }
    
    var scrollView: UIScrollView?
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        guard let scrollView = self.scrollView else { return }
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.black
        view.addSubview(scrollView)
        
        let constraintWidth = NSLayoutConstraint(item: scrollView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let constraintHeight = NSLayoutConstraint(item: scrollView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
        let constraintCenterX = NSLayoutConstraint(item: scrollView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let constraintCenterY = NSLayoutConstraint(item: scrollView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        view.addConstraints([
            constraintWidth, constraintHeight,
            constraintCenterX, constraintCenterY
        ])
    }
    
    /**
     * Draw a square UIView and set it's color by using a hex color code.
     */
    private func demoColorHex() {
        guard let scrollView = self.scrollView else { return }
        
        // draw amber square
        let squareView = UIView(frame: CGRect(x: 40.0, y: 40.0, width: 50.0, height: 50.0))
        squareView.backgroundColor = UIColor(hex: "f0a30a")
        scrollView.addSubview(squareView)
    }
    
    /**
     * Filter an HTML string, trim it to a given length, and calculate the height required to display in a UILabel
     * with a 320p set width.
     */
    private func demoString() {
        guard let scrollView = self.scrollView else { return }
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 35.0)
        label.textColor = UIColor(hex: "008a00")
        label.numberOfLines = 0
        label.backgroundColor = UIColor(hex: "7a3b3f")
        scrollView.addSubview(label)
        
        let htmlString = "<p>This is an HTML text paragraph that <strong>contains</strong> various HTML <em>markups</em>.</p><br /><p>Often times it is required to display HTML text as simple text, therefore you should strip all HTML markup before displaying it.</p>"
        // removing all html tags
        let textString = htmlString.htmlTagsFiltered()
        
        // triming to a specified length
        let trimmedString = textString.trimToLength(length: 128)
        
        label.text = trimmedString
        
        // let's say we need to display the text in a UILabel with a width of 320p, and we need to calculate the
        // required height of the text view to display the entire string
        let requiredHeight = trimmedString.requiredHeightToDisplay(forWidth: 320.0, withFont: label.font!)
        
        // setting constraints
        let constraintWidth = NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 320.0)
        let constraintHeight = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: requiredHeight)
        let constraintLeading = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 40.0)
        let constraintTop = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 130.0)
        scrollView.addConstraints([
            constraintWidth, constraintHeight,
            constraintLeading, constraintTop
        ])
    }
    
    /**
     * Create an UIImage with text content.
     */
    private func demoImage() {
        guard let scrollView = self.scrollView else { return }
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.white
        scrollView.addSubview(imageView)
        
        let constraintWidth = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 320.0)
        let constraintHeight = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150.0)
        let constraintLeading = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 40.0)
        let constraintTrailig = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: scrollView, attribute: .trailing, multiplier: 1.0, constant: -40.0)
        let constraintTop = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 537.0)
        let constraintBottom = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: -40.0)
        scrollView.addConstraints([
            constraintWidth, constraintHeight,
            constraintLeading, constraintTrailig, constraintTop, constraintBottom
        ])
        
        if let font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 20.0) {
            imageView.image = UIImage(
                size: CGSize(width: 320.0, height: 150.0),
                font: font,
                color: UIColor(hex: "00aba9"),
                content: "This is an image\ngenerated programatically"
            )
        }
    }
}
