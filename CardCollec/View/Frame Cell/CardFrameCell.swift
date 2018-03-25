//
//  UIKit.swift
//  CardCollec
//
//  Created by Sung Jae Min on 1/22/18.
//  Copyright © 2018 CardCollec. All rights reserved.
//

import UIKit

class CardFrameCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var cardFrame: CardFrame? {
        didSet {
            guard let cardFrame = cardFrame else{
                return
            }
            imageView.image = UIImage(named: cardFrame.imageName)
        }
    }
    
    let imageView: UIImageView = {
        let image = UIImage(named: "cardframe_regular")
        let iv = UIImageView(image: image)
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    func setupViews() {

        addSubview(imageView)
        backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1.0)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor,constant:20).isActive = true
        imageView.widthAnchor.constraint(equalTo:self.widthAnchor, multiplier: 1.0).isActive = true
        imageView.heightAnchor.constraint(equalTo:self.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
