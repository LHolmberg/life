//
//  CaloriesVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-10.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class CaloriesVC : UIViewController {
    
    @IBOutlet weak var selectedIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.Animate()
    }
}
