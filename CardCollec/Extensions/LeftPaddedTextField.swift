//
//  LeftPaddedTextField.swift
//  CardCollec
//
//  Created by Sung Jae Min on 9/2/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

/* Add paddding to the left side of text field */

class LeftPaddedTextField: UITextField{
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}
