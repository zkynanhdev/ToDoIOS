//
//  custome_view.swift
//  first_app
//
//  Created by AnhPhamPC on 5/31/23.
//

import UIKit

class CustomeView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        let useAvatar = UIImageView(image: UIImage(named: "no avatar"))
        useAvatar.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        useAvatar.contentMode = .scaleAspectFill
        self.addSubview(useAvatar)
        
        let userName = UILabel(frame: CGRect(x: 0, y: frame.size.height*4/5, width:frame.size.width, height: frame.size.height))
        userName.text = "adadad"
        userName.textColor = .blue
        userName.backgroundColor = .yellow
        userName.textAlignment = .center
        self.addSubview(userName)
        
        // add button
        let button = UIButton(frame: CGRect(x: 0,y: 0,width: frame.size.width,height: frame.size.height))
        button.backgroundColor = .clear
        self.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
