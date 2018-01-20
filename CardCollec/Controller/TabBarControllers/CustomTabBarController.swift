//
//  CustomTabBarControllerViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 12/1/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bcardController = BCardViewController()
        let bcard = UINavigationController(rootViewController: bcardController)
        bcard.title = "B-Card"
        
        let connectionsController = ConnectionsViewController()
        let connections = UINavigationController(rootViewController: connectionsController)
        connections.title = "Connections"
        
        let moreController = MoreViewController()
        let more = UINavigationController(rootViewController: moreController)
        more.title = "More Cards"
        
        let settingsController = SettingsViewController()
        let settings = UINavigationController(rootViewController: settingsController)
        settings.title = "Settings"
        
        viewControllers = [bcard,connections,more,settings]

        // Do any additional setup after loading the view.
        
        //self.tabBarController?.tabBar.tintColor = .red
    }
}
