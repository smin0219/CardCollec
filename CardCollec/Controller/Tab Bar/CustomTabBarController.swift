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
        
        let businessCardController = BusinessCardViewController()
        let businessCard = UINavigationController(rootViewController: businessCardController)
        businessCard.title = "My Cards"
        
        let connectionsController = ConnectionsViewController()
        let connections = UINavigationController(rootViewController: connectionsController)
        connections.title = "Connections"
        
        let moreController = MoreViewController()
        let more = UINavigationController(rootViewController: moreController)
        more.title = "Find"
        
        let settingsController = SettingsViewController()
        let settings = UINavigationController(rootViewController: settingsController)
        settings.title = "Settings"
        
        viewControllers = [businessCard,connections,more,settings]

        // Do any additional setup after loading the view.
        
        //self.tabBarController?.tabBar.tintColor = .red
    }
}
