//
//  BookPagerController.swift
//  KindleApp
//
//  Created by Uchenna  Aguocha on 12/26/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController {
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        navigationItem.title = "Book"
    }
    
}

extension BookPagerController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}












