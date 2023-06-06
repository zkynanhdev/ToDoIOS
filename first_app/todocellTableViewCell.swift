//
//  todocellTableViewCell.swift
//  first_app
//
//  Created by AnhPhamPC on 6/6/23.
//

import UIKit

class todocellTableViewCell: UITableViewCell {
    
    var editAction : (() -> Void)? = nil
    var deleteAction: (() -> Void)? = nil

    
    
    @IBOutlet weak var indexLB: UILabel!
    @IBOutlet weak var nameLB: UILabel!
    
    @IBAction func btDelete(_ sender: UIButton) {
        if let btDelete = self.deleteAction {
            btDelete()
        }
    }
    @IBAction func btEdit(_ sender: UIButton) {
        if let btEdit = self.editAction {
            btEdit()
        }
    }
    
    @objc func btEditTapped(sender: UITapGestureRecognizer) {
            }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
