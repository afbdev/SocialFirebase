//
//  CircleView.swift
//  SocialFirebase
//
//  Created by afbdev on 1/11/17.
//  Copyright © 2017 afbdev. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
    


}
