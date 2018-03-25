//
//  PreviewViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 3/25/18.
//  Copyright © 2018 CardCollec. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.text = "Preview"
        label.textColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newcard: UIView = {
        let card = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //card.draw(CGRect(x: 50, y: 50, width: 250, height: 250))
        card.layer.cornerRadius = 10
        card.backgroundColor = .white
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    let tooltipTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "Click information on the card if you want to edit."
        textView.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        textView.backgroundColor = UIColor(displayP3Red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0)
        textView.textColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel to create a new card", for: .normal)
        button.setTitleColor(UIColor(displayP3Red: 237/255, green: 145/255, blue: 33/255, alpha: 1.0), for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickedCancelButton), for: .touchUpInside)
        return button
    }()
    
    let createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 237/255, green: 145/255, blue: 33/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(clickedCreateButton), for: .touchUpInside)
        
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(clickedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    func setupView(){
        view.backgroundColor = UIColor(displayP3Red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0)
        addSubviews()
        addConstraints()
    }
 
    func addSubviews(){
        view.addSubview(previewLabel)
        view.addSubview(newcard)
        view.addSubview(tooltipTextView)
        view.addSubview(createButton)
        view.addSubview(backButton)
        
    }
    
    func addConstraints(){
        previewLabelConstraint()
        newCardConstraint()
        tooltipConstraint()
        createButtonConstraint()
        backButtonConstraint()
    }
    
    func previewLabelConstraint(){
        previewLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        previewLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
    
    func newCardConstraint(){
        
        let width = view.frame.width
        
        newcard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newcard.topAnchor.constraint(equalTo: previewLabel.topAnchor, constant: 70).isActive = true
        //newcard.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        newcard.heightAnchor.constraint(equalToConstant: 220).isActive = true
        print(width)
        if(width < 350){
            newcard.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        }
        else{
            newcard.widthAnchor.constraint(equalToConstant: 350).isActive = true
        }
    }
    
    func tooltipConstraint(){
        tooltipTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tooltipTextView.topAnchor.constraint(equalTo: newcard.bottomAnchor, constant: 30).isActive = true
        tooltipTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        tooltipTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func createButtonConstraint(){
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createButton.bottomAnchor.constraint(equalTo: backButton.topAnchor).isActive = true
        createButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    func backButtonConstraint(){
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    @objc func clickedCreateButton(){
        
    }
    
    @objc func clickedCancelButton(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func clickedBackButton(){
        navigationController?.popViewController(animated: true)
    }
}
