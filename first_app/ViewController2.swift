//
//  ViewController2.swift
//  first_app
//
//  Created by AnhPhamPC on 6/2/23.
//

import UIKit

class ViewController2: UIViewController {
    
    weak var delegate: ToDoDelegate?
    var todoData: ToDoData?

    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTextEdit.text = todoData?.name
    }
    
    @IBOutlet weak var toDoTextEdit: UITextField!
    
    @IBAction func updateBt(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.onToDoReady(todoData: ToDoData(id: self.todoData?.id ?? -1, name: toDoTextEdit.text ?? ""))
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
