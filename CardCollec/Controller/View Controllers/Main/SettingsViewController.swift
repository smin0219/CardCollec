//
//  MessageViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 12/2/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviagationBar()

        // Do any additional setup after loading the view.
    }
    
    func setupNaviagationBar() {
        let leftBarButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(clickLogoutButton))
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
    }
    
    @objc func clickLogoutButton() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
