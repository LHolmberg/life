//
//  TodoVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-09.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//


import UIKit

class TodoVC : UIViewController {
    
    @IBOutlet weak var selectedIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.Animate()
    }
}
