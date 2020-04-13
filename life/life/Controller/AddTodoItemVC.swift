//
//  AddTodoItemVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-12.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class AddTodoItemVC : UIViewController {
    
    @IBOutlet weak var newTodoTxt: UITextField!
    
    @IBAction func Close(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func AddTodoFinal(_ sender: Any) {
        let parentVC = (self.parent)! as! TodoVC
        
        if newTodoTxt.text == "" {
            let alert = UIAlertController(title: "Alert", message: "You forgot to enter the new item!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            parentVC.todoListSaved.append(newTodoTxt.text ?? "")
            parentVC.tableView.reloadData()
            
            UserDefaults.standard.set(parentVC.todoListSaved, forKey: "todoList")
            self.view.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        newTodoTxt.becomeFirstResponder()
    }
}
