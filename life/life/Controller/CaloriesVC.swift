//
//  CaloriesVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-10.
//

import UIKit

class CaloriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var selectedIndicator: UIView!
    @IBOutlet weak var currentDateTxt: UILabel!
    @IBOutlet weak var currentWeekdayTxt: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentIntakeTxt: UILabel!

    var eatenFood: [[String: Any]] = (UserDefaults.standard.array(forKey: "eatenFood")
        as? [[String: Any]]) ?? [[String: Any]()]
    // swiftlint:disable identifier_name
    @IBAction func AddNewFood(_ sender: Any) {
        let addFoodPopup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "afID")
        self.addChild(addFoodPopup)
        addFoodPopup.view.frame = self.view.frame
        self.view.addSubview(addFoodPopup.view)
        addFoodPopup.didMove(toParent: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.animate()
        let date = Date()
        currentIntakeTxt.text = String(UserDefaults.standard.integer(forKey: "intakeToday"))
        currentDateTxt.text = date.getCurrentDate()
        currentWeekdayTxt.text = date.getCurrentWeekday()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func stringFromAny(_ value: Any?) -> String {
        if let nonNil = value, !(nonNil is NSNull) {
            return String(describing: nonNil)
        }
        return ""
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eatenFood.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "addedFoodCell", for: indexPath) as! AddedFoodCell
        // swiftlint:enable force_cast
        let val: [String: Any] = eatenFood[indexPath.row]
        cell.foodName.text = stringFromAny(val["name"])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let val: [String: Any] = eatenFood[indexPath.row]
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "intakeToday") -
                Int(stringFromAny(val["calories"]))!, forKey: "intakeToday")
            currentIntakeTxt.text = String(UserDefaults.standard.integer(forKey: "intakeToday"))
            eatenFood.remove(at: indexPath.row)
            UserDefaults.standard.set(eatenFood, forKey: "eatenFood")
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
