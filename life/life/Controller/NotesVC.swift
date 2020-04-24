//
//  ViewController.swift
//  life
//
//  Created by Lukas Holmberg on 2020-03-19.
//

import UIKit

class NotesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedIndicator: UIView!
    
    var savedNotes = UserDefaults.standard.array(forKey: "notes") ?? [[String: String]]()
    var selectedNote = [String: String]()
    // swiftlint:disable identifier_name
    @IBAction func CreateNote(_ sender: Any) {
        let createNotePopup = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "cnID")
        
        self.addChild(createNotePopup)
        createNotePopup.view.frame = self.view.frame
        self.view.addSubview(createNotePopup.view)
        createNotePopup.didMove(toParent: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.animate()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // swiftlint:disable force_cast
        selectedNote = savedNotes[indexPath.row] as! [String: String]
        savedNotes.remove(at: indexPath.row)
        let editNotePopup = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "enID")
        self.addChild(editNotePopup)
        editNotePopup.view.frame = self.view.frame
        self.view.addSubview(editNotePopup.view)
        editNotePopup.didMove(toParent: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedNotes.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        // swiftlint:enable force_cast
        if let notes = UserDefaults.standard.array(forKey: "notes") as? [[String: Any]] {
            cell.noteTitle.text = notes[indexPath.row]["title"] as? String
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            savedNotes.remove(at: indexPath.row)
            UserDefaults.standard.set(savedNotes, forKey: "notes")
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
