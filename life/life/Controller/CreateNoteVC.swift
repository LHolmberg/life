//
//  CreateNoteVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-12.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class CreateNoteVC : UIViewController {
    
    @IBOutlet weak var noteTitleTxt: UITextField!
    
    @IBAction func CreateNoteFinal(_ sender: Any) {
        let parentVC = (self.parent)! as! NotesVC
        let noteDict = ["title" : noteTitleTxt.text ?? "", "content":""] as [String : Any]
        parentVC.arr.insert(noteDict, at: 0)
        parentVC.tableView.reloadData()
        
        UserDefaults.standard.set(parentVC.arr, forKey: "notes")
        self.view.removeFromSuperview()
    }
    @IBAction func Close(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        noteTitleTxt.becomeFirstResponder()
    }
}
