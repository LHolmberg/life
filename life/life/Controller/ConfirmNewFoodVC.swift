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
    let uDef = UserDefaults.standard
    var foodLbl: String = ""
    var calories: Double = 0
    var protein: Double = 0
    var fat: Double = 0
    var carbs: Double = 0
    
    // swiftlint:disable identifier_name
    @IBAction func Cancel(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func AddFinal(_ sender: Any) {
        // swiftlint:disable force_cast
        let parentVC = (self.parent)! as! AddFoodVC
        let calVC = (parentVC.parent)! as! CaloriesVC
        calVC.eatenFood.append(
            ["name": foodLbl, "calories": calories]
        )
        uDef.set(calVC.eatenFood, forKey: "eatenFood")
        uDef.set(calories + Double(uDef.integer(forKey: "intakeToday")),
            forKey: "intakeToday")
        
        calVC.currentIntakeTxt.text = String(uDef.integer(forKey: "intakeToday"))
        calVC.tableView.reloadData()
        
        self.view.removeFromSuperview()
        parentVC.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        // swiftlint:disable force_cast
        let parentVC = (self.parent)! as! AddFoodVC
        if let food = parentVC.arr[parentVC.foodId]["food"] as? [String: Any] {
            if let nutrients = food["nutrients"] as? [String: Any] {
                foodLbl = food["label"] as! String
                protein = nutrients["PROCNT"] as? Double ?? 0
                fat = nutrients["FAT"] as? Double ?? 0
                carbs = nutrients["CHOCDF"] as? Double ?? 0
                calories = (protein*4) + (fat*9) + (carbs*4)
            }
        }
        foodName.text = foodLbl
        proteinTxt.text = String(format: "%.0f", protein)
        fatTxt.text = String(format: "%.0f", fat)
        carbsTxt.text = String(format: "%.0f", carbs)
    }
}
