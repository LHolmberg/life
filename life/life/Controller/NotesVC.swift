//
//  ViewController.swift
//  life
//
//  Created by Lukas Holmberg on 2020-03-19.
//  Copyright © 2020 Stefan Holmberg. All rights reserved.
//

import UIKit

class NotesVC : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedIndicator: UIView!
    
    var arr = UserDefaults.standard.array(forKey: "notes") ?? [Dictionary<String,String>]()
    var selectedNote = Dictionary<String,String>()
    
    @IBAction func CreateNote(_ sender: Any) {
        let createNotePopup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cnID") as! CreateNoteVC
        self.addChild(createNotePopup)
        createNotePopup.view.frame = self.view.frame
        self.view.addSubview(createNotePopup.view)
        createNotePopup.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.Animate()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNote = arr[indexPath.row] as! [String : String]
        arr.remove(at: indexPath.row)
        
        let editNotePopup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "enID") as! EditNoteVC
        self.addChild(editNotePopup)
        editNotePopup.view.frame = self.view.frame
        self.view.addSubview(editNotePopup.view)
        editNotePopup.didMove(toParent: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        if let notes = UserDefaults.standard.array(forKey: "notes") as? [[String: Any]] {
            cell.noteTitle.text = notes[indexPath.row]["title"] as! String?
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arr.remove(at: indexPath.row)
            UserDefaults.standard.set(arr, forKey: "notes")
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

class NoteCell: UITableViewCell {
    @IBOutlet weak var noteTitle: UILabel!
    
}
