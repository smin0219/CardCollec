//
//  PersonalInformationViewController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 2/14/18.
//  Copyright © 2018 CardCollec. All rights reserved.
//

import UIKit

class AddCompanyNameViewController: UIViewController, UITextFieldDelegate {
    
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
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        hidesBottomBarWhenPushed = true
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Where do you belong to?"
        label.textColor = UIColor(displayP3Red: 235/255, green: 117/255, blue: 24/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return label
    }()

    let nameTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.placeholder = "Enter your company name or title"
        textField.returnKeyType = .done
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.textContentType = UITextContentType("")
        
        return textField
    }()
    
    let tooltipTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "Enter your company or organization name. It also can be your title."
        textView.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        textView.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let selectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 235/255, green: 117/255, blue: 24/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(clickedSelectButton), for: .touchUpInside)
        
        return button
        
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.addTarget(self, action: #selector(clickedCancelButton), for: .touchUpInside)
        
        return button
    }()

    func setupView(){
        view.backgroundColor = UIColor(displayP3Red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0)
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews(){
        view.addSubview(nameTextField)
        view.addSubview(nameLabel)
        view.addSubview(tooltipTextView)
        view.addSubview(selectButton)
        view.addSubview(cancelButton)
    }
    
    func setupConstraints(){
        nameLabelConstraint()
        nameTextFieldConstraint()
        tooltipTextViewConstraint()
        selectButtonConstraint()
        cancelButtonConstraint()
    }
    
    func nameLabelConstraint(){
        nameLabel.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -30).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func nameTextFieldConstraint(){
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func tooltipTextViewConstraint(){
        tooltipTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tooltipTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15).isActive = true
        tooltipTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        tooltipTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func selectButtonConstraint(){
        selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor).isActive = true
        selectButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        selectButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    func cancelButtonConstraint(){
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
    }
    
    func setupNavigationBar(){
        navigationItem.title  = ""
    }
    
    fileprivate func keyboardSetting(){
        self.nameTextField.delegate = self
        self.nameTextField.autocorrectionType = .no
        self.nameTextField.clearButtonMode = .whileEditing
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameTextField.endEditing(true)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        clickedSelectButton()
        return true
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        /*
         self.mainLogo.isHidden = true
         self.forgotPasswordButton.isHidden = true
         self.registerButton.isHidden = true
         self.cardLogo.isHidden = false
         */
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        /*
         self.mainLogo.isHidden = false
         self.forgotPasswordButton.isHidden = false
         self.registerButton.isHidden = false
         self.cardLogo.isHidden = true
         */
    }
    
    @objc func clickedSelectButton(){
        let addEmail = AddEmailViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.pushViewController(addEmail, animated: true)
    }
    
    @objc func clickedCancelButton(){
        navigationController?.popToRootViewController(animated: true)
    }
}

