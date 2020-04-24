//
//  ConfirmNewFoodVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-16.
//

import UIKit

class ConfirmNewFoodVC: UIViewController {
    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var proteinTxt: UILabel!
    @IBOutlet weak var fatTxt: UILabel!
    @IBOutlet weak var carbsTxt: UILabel!
    // swiftlint:disable identifier_name
    @IBAction func AddFinal(_ sender: Any) {
        // swiftlint:disable force_cast
        let parentVC = (self.parent)! as! AddFoodVC
        let calVC = (parentVC.parent)! as! CaloriesVC
        // swiftlint:enable force_cast
        let calories = 300
        
        calVC.eatenFood.append(
            ["name": parentVC.foodId, "calories": calories]
        )
        
        UserDefaults.standard.set(calVC.eatenFood, forKey: "eatenFood")
        UserDefaults.standard.set(calories + UserDefaults.standard.integer(forKey: "intakeToday"),
            forKey: "intakeToday")
        
        calVC.currentIntakeTxt.text = String(UserDefaults.standard.integer(forKey: "intakeToday"))
        calVC.tableView.reloadData()
        
        self.view.removeFromSuperview()
        parentVC.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }

}
