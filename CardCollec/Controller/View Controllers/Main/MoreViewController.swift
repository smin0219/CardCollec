//
//  MoreViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 12/2/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    let logo: UILabel = {
        let label = UILabel()
        label.text = "Card collec"
        label.textColor = UIColor(displayP3Red: 29/255, green: 136/255, blue: 229/255, alpha: 1.0)
        label.font = UIFont(name: "DevanagariSangamMN", size: 70)
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label
    }()
    
    let logoutBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log out", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func setupView(){
        view.backgroundColor = .white
    }
    
    func addSubviews(){
        //view.addSubview(logoutBtn)
        view.addSubview(logo)
    }
    
    func setupConstraints(){
        logoConstraint()
        //setLogoutBtnConstraint()
    }
    
    func logoConstraint(){
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setLogoutBtnConstraint(){
        logoutBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
