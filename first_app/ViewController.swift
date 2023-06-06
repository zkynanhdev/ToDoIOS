//
//  ViewController.swift
//  first_app
//
//  Created by AnhPhamPC on 5/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    var names: [ToDoData] = []
    
    var todo: ToDoData?
    
    @IBOutlet weak var addButton: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
                    if sender.state == .ended {
                        navigateEditScreen(todo: nil)
                    }
            }
    
    func navigateEditScreen(todo: ToDoData?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "screen2") as ViewController2
        vc.delegate = self
        vc.todoData = todo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "todocellTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        names = getToDos()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
                        addButton.addGestureRecognizer(tapGR)
                        addButton.isUserInteractionEnabled = true
    }
    
    func getToDos() -> [ToDoData] {
        var totos = [ToDoData]()
        
        for i in 1...20{
            let toto = ToDoData(id: i, name: "todo \(i)")
            totos.append(toto)
        }
        return totos
    }
    
}

extension ViewController: ToDoDelegate {
    func onToDoReady(todoData: ToDoData) {
        var todo: ToDoData?
        if todoData.id != -1 {
            todo = todoData
            names.first(where: {$0.id == todoData.id})?.name = todoData.name
        } else {
            todo = ToDoData(id: names.last!.id+1, name: todoData.name)
            names.append(todo!)
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! todocellTableViewCell
        cell.indexLB.text = String(describing: names[indexPath.row].id)
        cell.nameLB.text = names[indexPath.row].name
        
        cell.editAction = {
            self.todo = self.names[indexPath.row]
            self.navigateEditScreen(todo: self.todo)
        }
        cell.deleteAction = {
            self.names.remove(at: indexPath.row)
            tableView.reloadData()
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(String(describing: self.names[indexPath.row].name))")
    }
}
