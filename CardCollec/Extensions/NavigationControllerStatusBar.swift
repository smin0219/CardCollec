//
//  NavigationControllerStatusBar.swift
//  CardCollec
//
//  Created by Sung Jae Min on 2/14/18.
//  Copyright © 2018 CardCollec. All rights reserved.
//

import UIKit
extension UINavigationController{
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
