//
//  GradientView.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-09.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class GradientView : UIView {
    
    func SetGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.frame
        
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        SetGradientBackground()
    }
}
