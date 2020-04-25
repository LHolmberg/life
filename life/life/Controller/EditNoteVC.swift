//
//  EditNoteVC.swift
//  life
//
//  Created by Lukas Holmberg on 2020-04-13.
//

import UIKit

class EditNoteVC: UIViewController {
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var contentTxt: UITextView!
    let uDef = UserDefaults.standard
    // swiftlint:disable identifier_name
    @IBAction func Back(_ sender: Any) {
        // swiftlint:disable force_cast
        let parentVC = (self.parent)! as! NotesVC
        parentVC.savedNotes.remove(at: 0)
        parentVC.selectedNote["content"] = contentTxt.text
        parentVC.savedNotes.insert(parentVC.selectedNote, at: 0)
        uDef.set(parentVC.savedNotes, forKey: "notes")
        parentVC.tableView.reloadData()
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let parentVC = (self.parent)! as! NotesVC
        // swiftlint:enable force_cast
        parentVC.savedNotes.insert(parentVC.selectedNote, at: 0)
        uDef.set(parentVC.savedNotes, forKey: "notes")
        titleTxt.text = parentVC.selectedNote["title"]
        contentTxt.text = parentVC.selectedNote["content"]
        contentTxt.becomeFirstResponder()
    }
}
