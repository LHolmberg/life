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
        if noteTitleTxt.text == "" {
            let alert = UIAlertController(title: "Alert", message: "You forgot to enter the new item!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            let parentVC = (self.parent)! as! NotesVC
            let noteDict = ["title" : noteTitleTxt.text!, "content":""] as [String : Any]
            
            parentVC.savedNotes.insert(noteDict, at: 0)
            parentVC.tableView.reloadData()
            
            UserDefaults.standard.set(parentVC.savedNotes, forKey: "notes")
            self.view.removeFromSuperview()
        }
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
