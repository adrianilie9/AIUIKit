//
//  AIUIKit.swift
//  AIUIKit
//
//  Copyright © 2020 Adrian Ilie. All rights reserved.
//

import UIKit

public class AIUIKit {
    /**
     * Replace current root view controler with the specified view controller.
     *
     * - parameter viewController: instance of view controller to replace the current root view controller
     */
    public static func replaceRootViewController(viewController: UIViewController) {
        var window: UIWindow?
        
        // identify main window for the application
        if #available(iOS 13.0, *) {
            guard let windowScene = (UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }.first) as? UIWindowScene else { return }
            let windows = windowScene.windows.filter{ return $0.isMember(of: UIWindow.classForCoder()) }
            window = (windows.count == 1) ? windows[0] : nil
            
        } else {
            if let appDelegateWindow = UIApplication.shared.delegate?.window {
                window = appDelegateWindow
            }
        }
        
        // dismiss current root view controller to free up memory
        if let rootViewController = window?.rootViewController {
            rootViewController.dismiss(animated: false) {
                rootViewController.view.removeFromSuperview()
            }
        }
        
        // replace root view controller
        window?.rootViewController = viewController
    }
}
