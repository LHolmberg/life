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
    @IBOutlet weak var currentDateTxt: UILabel!
    @IBOutlet weak var currentWeekdayTxt: UILabel!
    
    @IBAction func AddNewFood(_ sender: Any) {
            print("HELLO")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.Animate()
        let date = Date()
        
        currentDateTxt.text = date.GetCurrentDate()
        currentWeekdayTxt.text = date.GetCurrentWeekday()
    }
}


