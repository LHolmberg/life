import UIKit

class AddTodoItemVC: UIViewController {
    @IBOutlet weak var newTodoTxt: UITextField!
    // swiftlint:disable identifier_name
    @IBAction func Close(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    @IBAction func AddTodoFinal(_ sender: Any) {
        // swiftlint:disable force_cast
        let parentVC = (self.parent)! as! TodoVC
        // swiftlint:enable force_cast
        if newTodoTxt.text!.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "You forgot to enter the new item!",
                preferredStyle: UIAlertController.Style.alert)
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
