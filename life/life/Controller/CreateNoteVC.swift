import UIKit

class CreateNoteVC: UIViewController {

    @IBOutlet weak var noteTitleTxt: UITextField!
    // swiftlint:disable identifier_name
    @IBAction func CreateNoteFinal(_ sender: Any) {
        if noteTitleTxt.text!.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "You forgot to enter the new item!",
                preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            // swiftlint:disable force_cast
            let parentVC = (self.parent)! as! NotesVC
            // swiftlint:enable force_cast
            let noteDict = ["title": noteTitleTxt.text!, "content": ""] as [String: Any]
            
            parentVC.savedNotes.insert(noteDict, at: 0)
            parentVC.tableView.reloadData()
            
            UserDefaults.standard.set(parentVC.savedNotes, forKey: "notes")
            self.view.removeFromSuperview()
        }
    }
    // swiftlint:disable identifier_name
    @IBAction func Close(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        noteTitleTxt.becomeFirstResponder()
    }
}
