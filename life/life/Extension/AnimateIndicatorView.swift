//
//  AnimateIndicatorView.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-10.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

extension UIView {
    func Animate() {
        let timeInterval : Double = 1 * pow(10, -5)
        let maxWidth : CGFloat = 50.0
        let increaseWith : CGFloat = 0.01
        
        _ = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            if self.frame.width < maxWidth {
                self.frame = CGRect(x: self.frame.origin.x - increaseWith / 2, y: self.frame.origin.y, width: self.frame.width + increaseWith, height: self.frame.height)
            }
        }
    }
}
