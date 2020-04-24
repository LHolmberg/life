//
//  AddFoodVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-15.
//

import UIKit

class AddFoodVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var foodId = Int()
    var arr = [Int]()
    // swiftlint:disable identifier_name
    @IBAction func Cancel(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func SearchFood(_ sender: Any) {
        let num = Int(foodName.text ?? "32")!
        arr.removeAll()
        for val in 1...num {
            arr.append(val)
        }
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchedFoodCell",
            for: indexPath) as! SearchedFoodCell
        // swiftlint:enable force_cast
        cell.foodName.text = String(arr[indexPath.row])
        cell.addFood.addTarget(self, action: #selector(Add), for: .touchUpInside)
        cell.addFood.tag = indexPath.row
        return cell
    }

    @objc func Add(sender: UIButton!) {
        foodId = sender.tag
        // swiftlint:disable force_cast
        let addPopup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cfID")
            as! ConfirmNewFoodVC
        // swiftlint:enable force_cast
        self.addChild(addPopup)
        addPopup.view.frame = self.view.frame
        self.view.addSubview(addPopup.view)
        addPopup.didMove(toParent: self)
    }
}
