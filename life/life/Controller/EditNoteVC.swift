//
//  EditNoteVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-13.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class EditNoteVC : UIViewController {
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var contentTxt: UITextView!
    
    @IBAction func Back(_ sender: Any) {
        let parentVC = (self.parent)! as! NotesVC
        parentVC.arr.remove(at: 0)
        parentVC.selectedNote["content"] = contentTxt.text
        parentVC.arr.insert(parentVC.selectedNote, at: 0)
        
        UserDefaults.standard.set(parentVC.arr, forKey: "notes")
        parentVC.tableView.reloadData()
        self.view.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parentVC = (self.parent)! as! NotesVC
        parentVC.arr.insert(parentVC.selectedNote, at: 0)
        UserDefaults.standard.set(parentVC.arr, forKey: "notes")
        
        titleTxt.text = parentVC.selectedNote["title"]
        contentTxt.text = parentVC.selectedNote["content"]
        
        contentTxt.becomeFirstResponder()
    }
}
