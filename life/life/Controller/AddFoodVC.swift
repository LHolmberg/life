import UIKit

class AddFoodVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var foodName: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var foodId = Int()
    var arr = [[String: Any]]()
    // swiftlint:disable identifier_name
    @IBAction func Cancel(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func SearchFood(_ sender: Any) {
        let url = "https://api.edamam.com/api/food-database/parser?nutrition-type=logging&ingr=" +
            foodName.text! + "&app_id=ff4e1b20&app_key=2d9c6a8b856074d6722ee656b76d6407"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
            
            if let d = data {
                if let value = String(data: d, encoding: String.Encoding.ascii) {
                    
                    if let jsonData = value.data(using: String.Encoding.utf8) {
                        do {
                            // swiftlint:disable force_cast
                            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                            self.arr = json["hints"] as! [[String: Any]]
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        } catch {
                            print("ERROR \(error.localizedDescription)")
                        }
                    }
                }
                
            }
            }.resume()
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
        if let foodLabel = arr[indexPath.row]["food"] as? [String: Any] {
            cell.foodName.text = foodLabel["label"] as? String
        }
        cell.addFood.addTarget(self, action: #selector(Add), for: .touchUpInside)
        cell.addFood.tag = indexPath.row
        return cell
    }
    func stringFromAny(_ value: Any?) -> String {
        if let nonNil = value, !(nonNil is NSNull) {
            return String(describing: nonNil)
        }
        return ""
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
