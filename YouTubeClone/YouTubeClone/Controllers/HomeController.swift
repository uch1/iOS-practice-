//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Uchenna  Aguocha on 12/28/17.
//  Copyright © 2017 Uchenna  Aguocha. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    let cellId = "cellId" // is a reuseIdentifier for dequequed cells
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Since I have a navigation controller, lets give the navbar a name
        navigationItem.title = "Home"
        
        // HomeController no longer have a regular view. It has a collection view
        collectionView?.backgroundColor = UIColor.white
        
        // Registering a cell on the collectionView
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }

}

// UICollectionView DataSource and DelegateFlowLayout Methods
extension HomeController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
}
