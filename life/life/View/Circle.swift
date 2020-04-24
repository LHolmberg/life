//
//  Circle.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-13.
//

import UIKit

class Circle: UIView {
    
    func render() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 200, height: 200)).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        render()
    }
}
