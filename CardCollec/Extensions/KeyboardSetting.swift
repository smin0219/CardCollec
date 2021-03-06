//
//  KeyboardSetting.swift
//  CardCollec
//
//  Created by Sung Jae Min on 9/21/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func observeKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardShow(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.bounds  = CGRect(x: 0, y: 40, width: self.view.bounds.width, height: self.view.bounds.height)
            }, completion: nil)
    }
 
    @objc func keyboardHide(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: nil)
    }
}
