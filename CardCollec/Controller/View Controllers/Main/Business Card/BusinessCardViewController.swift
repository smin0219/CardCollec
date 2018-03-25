//
//  HomeViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 9/21/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

class BusinessCardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.tabBarController?.tabBar.isHidden = false
        setupView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    static var deck:[Card] = []

    let emptyCardImg: UIImageView = {
        let image = UIImage(named: "emptyCard")
        let imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "addButton")
        
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickedAddButton), for: .touchUpInside)

        return button
    }()
    
    let addCardLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Click '+' button to add your first card"
        label.textColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /**
     * Setup and controller main view of this controller
     **/
    
    func setupView(){
        view.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        addSubviews()
        setupConstraints()
        setupNavigationBar()
        setupTabBar()
    }
    
    /**
     * Setup navigation bar
     **/
    
    func setupNavigationBar(){
        navigationController?.navigationBar.barStyle = .blackOpaque
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Sung Jae Min"
    }
    
    /**
     * Setup tab bar
     **/
    
    func setupTabBar(){
        tabBarController?.tabBar.tintColor = UIColor(displayP3Red: 237/255, green: 145/255, blue: 33/255, alpha: 1.0)
        tabBarController?.tabBar.unselectedItemTintColor = .white
        tabBarController?.tabBar.barTintColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        tabBarController?.tabBar.isTranslucent = false
        //tabBarController?.tabBar.isHidden = false
        hidesBottomBarWhenPushed = false
    }
    
    /**
     * Add subviews to main view
     **/
    
    func addSubviews(){
        view.addSubview(addButton)
        //view.addSubview(emptyCardImg)
        view.addSubview(addCardLabel)
    }
    
    /**
     * Contain all the constraints for subviews in main view
     **/
    
    func setupConstraints(){
        addButtonConstraint()
        //emptyCardImgConstraint()
        addCardLabelConstraint()
    }
    
    /**
     * Constraint for add button subview in main view
     **/
    
    func addButtonConstraint(){
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 43).isActive = true
    }
    
    /**
     * Constraint for empty card image subview in main view
     **/
    
    func emptyCardImgConstraint(){
        //emptyCardImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //emptyCardImg.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        //emptyCardImg.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: 1.0).isActive = true
        //emptyCardImg.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: 0.39).isActive = true
    }
    
    /**
     * Constraint for add card label (comment at the bottom) subview in main view
     **/
    
    func addCardLabelConstraint(){
        addCardLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addCardLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    /**
     * Action on add button when the button clicked
     **/
    
    func isEmpty()->Bool{
        if (BusinessCardViewController.deck.isEmpty) {
            return true
        }
        else{
            return false
        }
    }
    
    func addCard(){
        let card = Card()
        BusinessCardViewController.deck.append(card)
    }
    
    func getDeck()->[Card]{
        return BusinessCardViewController.deck
    }
    
    func getCard(index:Int)->Card{
        let card = BusinessCardViewController.deck[index]
        return card
    }
    
    func countCards()->Int{
        var num = 0
        if (!BusinessCardViewController.deck.isEmpty){
            while(num<BusinessCardViewController.deck.count && BusinessCardViewController.deck[num].name != ""){
                num+=1;
            }
        }
        return num
    }
    
    func updateCard(index: Int,frame:Int,title:String,name:String,email:String,address:String,phoneNumber:String){
        
        if(frame != -1){
            BusinessCardViewController.deck[index].frame = frame
        }
        if(title != ""){
            BusinessCardViewController.deck[index].title = title
        }
        if(name != ""){
            BusinessCardViewController.deck[index].name = name
        }
        if(email != ""){
            BusinessCardViewController.deck[index].email = email
        }
        if(address != ""){
            BusinessCardViewController.deck[index].address = address
        }
        if (phoneNumber != ""){
            BusinessCardViewController.deck[index].phoneNumber = phoneNumber
        }
    }

    @objc func clickedAddButton(){
        let selectFrameController = SelectFrameViewController()
        addCard()
        hidesBottomBarWhenPushed = true
        navigationController?.tabBarController?.tabBar.isHidden = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.pushViewController(selectFrameController, animated: true)
    }
}

