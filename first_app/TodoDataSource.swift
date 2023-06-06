//
//  TodoDataSource.swift
//  first_app
//
//  Created by AnhPhamPC on 6/5/23.
//

import Foundation

protocol ToDoDataSource : AnyObject {
    func viewControllerIdForRow(infoview: ViewController2) -> Int?
    func viewControllerNameForRow(infoview: ViewController2) -> String?
}
