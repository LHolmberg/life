//
//  CheckBox.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-12.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    let checkedImage = UIImage(named: "icons8-checked-checkbox-50")! as UIImage
    let uncheckedImage = UIImage(named: "icons8-unchecked-checkbox-50")! as UIImage
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
