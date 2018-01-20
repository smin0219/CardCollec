//
//  MainNavigationController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 9/20/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginRegisterController = LoginController()
        self.viewControllers = [loginRegisterController]
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}
