//
//  AddPhoneNumberViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 2/27/18.
//  Copyright © 2018 CardCollec. All rights reserved.
//

import UIKit

class AddPhoneNumberViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        keyboardSetting()
        observeKeyboardNotifications()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(self.phoneTextField.text?.isEmpty==false){
            self.continueButton.isHidden = false
        }
        else{
            self.continueButton.isHidden = true
        }
        self.cancelButton.isHidden = false
        hidesBottomBarWhenPushed = true
    }
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "What's your phone number?"
        label.textColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return label
    }()
    
    let phoneTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .phonePad
        textField.placeholder = "Enter your phone number"
        textField.returnKeyType = .done
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.textContentType = UITextContentType("")
        
        return textField
    }()
    
    let tooltipTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "Enter phone number to display on your card. You can add more phone numbers later."
        textView.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        textView.backgroundColor = UIColor(displayP3Red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0)
        textView.textColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 237/255, green: 145/255, blue: 33/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(clickedSelectButton), for: .touchUpInside)
        
        return button
        
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
        setupNavigationBar()
        addSubviews()
        addConstraints()
    }
    
    func addSubviews(){
        view.addSubview(phoneTextField)
        view.addSubview(phoneLabel)
        view.addSubview(tooltipTextView)
        view.addSubview(continueButton)
        view.addSubview(cancelButton)
        view.addSubview(backButton)
    }
    
    func addConstraints(){
        phoneLabelConstraint()
        phoneTextFieldConstraint()
        tooltipTextViewConstraint()
        continueButtonConstraint()
        cancelButtonConstraint()
        backButtonConstraint()
    }
    
    func phoneLabelConstraint(){
        phoneLabel.bottomAnchor.constraint(equalTo: phoneTextField.topAnchor, constant: -30).isActive = true
        phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func phoneTextFieldConstraint(){
        phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func tooltipTextViewConstraint(){
        tooltipTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tooltipTextView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 15).isActive = true
        tooltipTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        tooltipTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func continueButtonConstraint(){
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20).isActive = true
        continueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
    }
    
    func cancelButtonConstraint(){
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 100).isActive = true
    }
    
    func backButtonConstraint(){
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    func setupNavigationBar(){
        navigationItem.title  = ""
    }
    
    fileprivate func keyboardSetting(){
        self.phoneTextField.delegate = self
        self.phoneTextField.autocorrectionType = .no
        self.phoneTextField.clearButtonMode = .whileEditing
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.phoneTextField.endEditing(true)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        clickedSelectButton()
        return true
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        self.cancelButton.isHidden = true
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        if(self.phoneTextField.text?.isEmpty==false){
            self.tooltipTextView.isHidden = true
            self.continueButton.isHidden = false
        }
        else{
            self.tooltipTextView.isHidden = false
            self.continueButton.isHidden = true
        }
        self.cancelButton.isHidden = false
    }
    
    @objc func clickedSelectButton(){
        let addPhoneNumber = PreviewViewController()
        let bcard = BusinessCardViewController()
        
        bcard.updateCard(index: 0, frame: -1, title: "", name: "", email: "", address: "", phoneNumber: phoneTextField.text!)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.pushViewController(addPhoneNumber, animated: true)
    }
    
    @objc func clickedCancelButton(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func clickedBackButton(){
        navigationController?.popViewController(animated: true)
    }
}
