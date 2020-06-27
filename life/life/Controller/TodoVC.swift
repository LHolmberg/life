import UIKit

class TodoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedIndicator: UIView!
    var todoListSaved = UserDefaults.standard.stringArray(forKey: "todoList") ?? [String]()
    // swiftlint:disable identifier_name
    @IBAction func AddTodoItem(_ sender: Any) {
        let addItemPopup = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "raID")
        self.addChild(addItemPopup)
        addItemPopup.view.frame = self.view.frame
        self.view.addSubview(addItemPopup.view)
        addItemPopup.didMove(toParent: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndicator.animate()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListSaved.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoItemCell
        // swiftlint:enable force_cast
        cell.todoTxt.text = todoListSaved[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoListSaved.remove(at: indexPath.row)
            UserDefaults.standard.set(todoListSaved, forKey: "todoList")
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
