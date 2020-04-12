//
//  TodoVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-09.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//


import UIKit

class TodoVC : UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedIndicator: UIView!
    var arr = UserDefaults.standard.stringArray(forKey: "todoList") ?? [String]()
    
    @IBAction func AddTodoItem(_ sender: Any) {
        let answ = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "raID") as! AddTodoItemVC
        self.addChild(answ)
        answ.view.frame = self.view.frame
        self.view.addSubview(answ.view)
        answ.didMove(toParent: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.Animate()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryTableViewCell
        
        cell.todoTxt.text = arr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
            UserDefaults.standard.set(arr, forKey: "todoList")
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var todoTxt: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
