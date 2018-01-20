//
//  HomeViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 9/21/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

class BCardViewController: UIViewController {
    
    let emptyCardImg: UIImageView = {
        //button.setTitle("Hello", for: .normal)
        let image = UIImage(named: "emptyCard")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        //button.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "addButton")
        
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let addCardLabel: UILabel = {
        let label = UILabel()
        label.text = "Click '+' button to add your first card"
        label.textColor = .gray
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        setNavigationBar()
        setTabBar()
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.barTintColor = .black
        //self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Sung Jae Min"
    }
    
    func setTabBar(){
        self.tabBarController?.tabBar.tintColor = .white
        self.tabBarController?.tabBar.barTintColor = .black
        //self.tabBarController?.tabBar.isTranslucent = false
    }
    
    func addSubviews(){
        view.addSubview(addButton)
        view.addSubview(emptyCardImg)
        view.addSubview(addCardLabel)
    }
    
    func setConstraints(){
        addButtonConstraint()
        emptyCardImgConstraint()
        addCardLabelConstraint()
    }
    
    func addButtonConstraint(){
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func emptyCardImgConstraint(){
        emptyCardImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyCardImg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emptyCardImg.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: 1.0).isActive = true
        emptyCardImg.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: 0.3).isActive = true
    }
    
    func addCardLabelConstraint(){
        addCardLabel.topAnchor.constraint(equalTo: emptyCardImg.bottomAnchor, constant: 30).isActive = true
        addCardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

