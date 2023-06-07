//
//  CollectionController.swift
//  first_app
//
//  Created by AnhPhamPC on 6/7/23.
//

import UIKit

class CollectionController: UIViewController {
    
    var users: [User] = User.getUsers()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "collectionviewcell", bundle: .main)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension CollectionController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionviewcell
        
        let item = users[indexPath.row]
        cell.lbName.text = item.name
        
        return cell
    }
    
    
}
