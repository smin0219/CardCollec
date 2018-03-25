//
//  LoginRegisterController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 9/20/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardSetting()
        observeKeyboardNotifications()
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.passwordTextField.text = ""
    }
    
    let mainLogo: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "mainlogo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.contentMode = .scaleAspectFit
        
        return logoImage
    }()
    
    let cardLogo: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "mainlogo_typing")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.contentMode = .scaleAspectFit
        
        return logoImage
    }()
    
    let inputContainerView: UIView = {
        let container = UIView()
        
        container.backgroundColor = .white
        container.layer.borderColor = UIColor.red.cgColor
        container.layer.cornerRadius = 5
        container.layer.masksToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    private var phoneTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        
        textField.placeholder = "Enter your phone number"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.textContentType = UITextContentType("")
        
        return textField
    }()
    
    private var emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        
        textField.placeholder = "Enter your email address"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .emailAddress
        textField.textContentType = UITextContentType("")
        
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = LeftPaddedTextField()
        
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textContentType = UITextContentType("")
        
        return textField
    }()
    
    let textFieldSeperator: UIView = {
        let view = UIView()
        
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0), for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 237/255, green: 145/255, blue: 33/255, alpha: 1.0)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0), for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(handleForgotPasswordButton), for: .touchUpInside)
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor(displayP3Red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)
        button.setTitle("Create New Account", for: .normal)
        //button.setTitleColor( UIColor(displayP3Red: 235/255, green: 117/255, blue: 24/255, alpha: 1.0), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel!.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        
        return button
    }()
    
    func setupView(){
        view.backgroundColor = .white
        self.cardLogo.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        addSubviews()
        addConstraints()
    }
    
    func addSubviews(){
        view.addSubview(mainLogo)
        view.addSubview(cardLogo)
        view.addSubview(inputContainerView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(textFieldSeperator)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(registerButton)

    }
    
    func addConstraints(){
        mainLogoConstraint()
        cardLogoConstraint()
        inputContainerConstraint()
        loginButtonConstraint()
        registerButtonConstraint()
        forgotPasswordConstraint()
    }
    
    fileprivate func mainLogoConstraint(){
        mainLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130).isActive = true
    }
    
    fileprivate func cardLogoConstraint(){
        cardLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardLogo.bottomAnchor.constraint(equalTo: inputContainerView.topAnchor, constant: 20).isActive = true
    }
    
    fileprivate func inputContainerConstraint(){
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        inputContainerView.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: 0.16).isActive = true
        
        textFieldSeperatorConstraint()
        //phoneTextFieldConstraint()
        emailTextFieldConstraint()
        passwordTextFieldConstraint()
    }
    
    fileprivate func emailTextFieldConstraint(){
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    fileprivate func phoneTextFieldConstraint(){
        phoneTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        phoneTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    fileprivate func passwordTextFieldConstraint(){
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: textFieldSeperator.topAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    fileprivate func textFieldSeperatorConstraint(){
        textFieldSeperator.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        textFieldSeperator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        //textFieldSeperator.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor).isActive = true
        textFieldSeperator.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        textFieldSeperator.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    fileprivate func loginButtonConstraint(){
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        loginButton.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: 0.06).isActive = true
    }
    
    fileprivate func forgotPasswordConstraint(){
        forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
    }
    
    fileprivate func registerButtonConstraint(){
        
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 49).isActive = true
        registerButton.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
    }
   
    fileprivate func keyboardSetting(){
        self.emailTextField.delegate = self
        self.emailTextField.autocorrectionType = .no
        self.emailTextField.clearButtonMode = .whileEditing
        
        self.passwordTextField.delegate = self
        self.passwordTextField.autocorrectionType = .no
        self.passwordTextField.clearButtonMode = .whileEditing
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailTextField.endEditing(true)
        //self.phoneTextField.endEditing(true)
        self.passwordTextField.endEditing(true)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        self.mainLogo.isHidden = true
        self.forgotPasswordButton.isHidden = true
        self.registerButton.isHidden = true
        self.cardLogo.isHidden = false
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        self.mainLogo.isHidden = false
        self.forgotPasswordButton.isHidden = false
        self.registerButton.isHidden = false
        self.cardLogo.isHidden = true
    }
 
    @objc fileprivate func handleLoginButton(){
        let customTabBar = CustomTabBarController()
        customTabBar.modalTransitionStyle = .crossDissolve
        self.present(customTabBar, animated: true, completion: nil)
    }

}
