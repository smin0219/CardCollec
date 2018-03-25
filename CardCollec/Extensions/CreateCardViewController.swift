//
//  CreateCardController.swift
//  CardCollec
//
//  Created by Sung Jae Min on 12/1/17.
//  Copyright © 2017 CardCollec. All rights reserved.
//

import UIKit

class CreateCardViewController: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let h = rect.height
        let w = rect.width
        
        let color:UIColor = UIColor.yellow
        
        let drect = CGRect(x: w, y: h, width: w, height: h)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)
        
        color.set()
        bpath.stroke()
        
        print("it ran")
        NSLog("drawRect has updated the view")
    }
}
