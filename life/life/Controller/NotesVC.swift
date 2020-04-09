//
//  ViewController.swift
//  life
//
//  Created by Lukas Holmberg on 2020-03-19.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class NotesVC : UIViewController {

    @IBOutlet weak var selectedIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.Animate()
    }
}
