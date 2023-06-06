//
//  TodoDelegate.swift
//  first_app
//
//  Created by AnhPhamPC on 6/5/23.
//

import Foundation

protocol ToDoDelegate: AnyObject {
    func onToDoReady(todoData: ToDoData)
}
