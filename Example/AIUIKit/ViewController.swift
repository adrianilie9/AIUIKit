//
//  ViewController.swift
//  AIUIKit
//
//  Copyright (c) 2020 Adrian Ilie. All rights reserved.
//

import UIKit
import AIUIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
    }
    
    var scrollView: UIScrollView?
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        guard let scrollView = self.scrollView else { return }
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.black
        
        let constraintWidth = NSLayoutConstraint(item: scrollView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let constraintHeight = NSLayoutConstraint(item: scrollView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
        let constraintCenterX = NSLayoutConstraint(item: scrollView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let constraintCenterY = NSLayoutConstraint(item: scrollView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        view.addSubview(scrollView)
        view.addConstraints([
            constraintWidth, constraintHeight,
            constraintCenterX, constraintCenterY
        ])
    }
}

